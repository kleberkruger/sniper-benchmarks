/*
 * Copyright (C) 2003 CTIE, Monash University
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
*/

#include <stdio.h>
#include <string.h>
#include <omnetpp.h>

#include "EtherCtrl_m.h"
#include "EtherApp_m.h"
#include "utils.h"


#define MAX_REPLY_CHUNK_SIZE   1497


/**
 * Server-side process EtherAppCli.
 */
class EtherAppSrv : public cSimpleModule
{
  protected:
    int localSAP;
    int remoteSAP;

    long packetsSent;
    long packetsReceived;
    cOutVector eedVector;
    cStdDev eedStats;

  public:
    Module_Class_Members(EtherAppSrv,cSimpleModule,0);

    virtual void initialize();
    virtual void handleMessage(cMessage *msg);
    virtual void finish();

    void registerDSAP(int dsap);
    void sendPacket(cMessage *datapacket, const MACAddress& destAddr);
};

Define_Module (EtherAppSrv);

void EtherAppSrv::initialize()
{
    localSAP = ETHERAPP_SRV_SAP;
    remoteSAP = ETHERAPP_CLI_SAP;

    // statistics
    packetsSent = packetsReceived = 0;
    eedVector.setName("end-to-end delay");
    eedStats.setName("end-to-end delay");
    WATCH(packetsSent);
    WATCH(packetsReceived);

    registerDSAP(localSAP);
}

void EtherAppSrv::handleMessage(cMessage *msg)
{
    EV << "Received packet `" << msg->name() << "'\n";

    packetsReceived++;
    simtime_t lastEED = simTime() - msg->creationTime();
    eedVector.record(lastEED);
    eedStats.collect(lastEED);

    EtherAppReq *req = check_and_cast<EtherAppReq *>(msg);
    EtherCtrl *ctrl = check_and_cast<EtherCtrl *>(req->removeControlInfo());
    MACAddress srcAddr = ctrl->getSrc();
    long requestId = req->getRequestId();
    long replyBytes = req->getResponseBytes();
    char msgname[30];
    strcpy(msgname,msg->name());

    delete msg;
    delete ctrl;

    // send back packets asked by EtherAppCli side
    int k = 0;
#if !defined(SPEC_CPU)
    strcat(msgname,"-resp-");
    char *s = msgname+strlen(msgname);
#endif
    while (replyBytes>0)
    {
        int l = replyBytes>MAX_REPLY_CHUNK_SIZE ? MAX_REPLY_CHUNK_SIZE : replyBytes;
        replyBytes -= l;

#if !defined(SPEC_CPU)
        sprintf(s,"%d",k);

        EV << "Generating packet `" << msgname << "'\n";

        EtherAppResp *datapacket = new EtherAppResp(msgname, ETHCTRL_DATA);
#else

        EtherAppResp *datapacket = new EtherAppResp(NULL, ETHCTRL_DATA);
#endif
        datapacket->setRequestId(requestId);
        datapacket->setLength(8*l);
        sendPacket(datapacket, srcAddr);
        packetsSent++;

        k++;
    }

}

void EtherAppSrv::sendPacket(cMessage *datapacket, const MACAddress& destAddr)
{
    EtherCtrl *etherctrl = new EtherCtrl();
    etherctrl->setSsap(localSAP);
    etherctrl->setDsap(remoteSAP);
    etherctrl->setDest(destAddr);
    M30(datapacket)->setControlInfo(etherctrl);
    send(datapacket, "out");
}

void EtherAppSrv::registerDSAP(int dsap)
{
    EV << fullPath() << " registering DSAP " << dsap << "\n";

    EtherCtrl *etherctrl = new EtherCtrl();
    etherctrl->setDsap(dsap);
    cMessage30 *msg = new cMessage30("register_DSAP", ETHCTRL_REGISTER_DSAP);
    msg->setControlInfo(etherctrl);

    send(msg, "out");
}

void EtherAppSrv::finish()
{
    if (par("writeScalars").boolValue())
    {
        recordScalar("packets sent", packetsSent);
        recordScalar("packets rcvd", packetsReceived);
        recordScalar("end-to-end delay mean", eedStats.mean());
        recordScalar("end-to-end delay stddev", eedStats.stddev());
        recordScalar("end-to-end delay min", eedStats.min());
        recordScalar("end-to-end delay max", eedStats.max());
    }
}



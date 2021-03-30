Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B45534E135
	for <lists+nouveau@lfdr.de>; Tue, 30 Mar 2021 08:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B0989F3C;
	Tue, 30 Mar 2021 06:28:01 +0000 (UTC)
X-Original-To: Nouveau@lists.freedesktop.org
Delivered-To: Nouveau@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-oln040092074010.outbound.protection.outlook.com [40.92.74.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379EF89F3C
 for <Nouveau@lists.freedesktop.org>; Tue, 30 Mar 2021 06:28:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZ1WX16wS2bcdOFD02STSdwV/9AUCdFISBXcTGa4piJLxCuV4ErsjJpS6mZWfo6rO5YClmiOiRWZTMOU7crtYeA+mDNVtRbDz4VKitya1PylxZthE1oJ836M2hbk4l2VWLg2odgnPsVNyoC1pU4X9sb8gtUzizyDXClIEnaVeDZJ7CviG/AzOEJ5+8xY25/ZXV1WwMPFBxHOU8Y5HFh99XzBRE/8nfdSeBAr/LRDuyuFfnvhYXs5wcqciPGbqxsU/Y1ApDIujgg+6cnfWhG1KF5xe1GdkzPsknie1r0/DCofoNRrbRDQofLMpTGE5TZFU8Vm9WJS4BYTTyOgnPEdPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqygzBf8/v+Lh2tnNfj63PgYcQl3uckl5g5wx9acNg0=;
 b=h44fOwaBX0PUU67Wvu53YEYjTZGchttKbEtIJn2574IWeUGGOtp9pxXNzIaZN1fF7lVWuFmq3hIOWtTPpEne2hGEUGTlvH7ca1GDriKQFlnGA50bvFG7G/H6eGNVl7pimZOLvCebYsz6D3DiZHhaFu9RdePuNmWEOFpiokuxug6f9Hekvilf2Op4SIGaPkNZCefGgi/+9ab3TE+rKcD/L1ahTAWlj4PYA3hgRH8z/9jh2leyMM5sCS13fJhbwkr5wRDw4WjH7qMjHpLkNDSkKyyurLlYp0cHDNLX8EZAr/EE5Pp2vNr1fyf1n7kFHQcE6neCB2Y2z55MzN1yZWbpfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqygzBf8/v+Lh2tnNfj63PgYcQl3uckl5g5wx9acNg0=;
 b=EHNQbKVyjGvBQfqEF/sSiFxRoqfezGctNyLSiBH+VcBdj/L5HfP34M81zULog1UMbs1BDQW5mSoUAcp3Zq1LiAzar/W4DkaPBHiauXEm61YMOmQah30ZVzZONLsH1uUWRH6Yk90I/6gQ2uPBV/D2DpoYqVKMZjmVxNX36Iguka4IvxSEJpIyO0oqds/dxDiHVwiqDmRiM4hPd6uK9+w7sKAiE/pJ3aCmG31Fnnji99c2XYzLOGORzr/F5Uz7wIdaRbMB1Jle7qMOpoySP7QSmR9uTd8fRVY0/JX+qzLPKYtcV3stEG3Pw14h2FpjYA/4sL3X8Y3WwhiGQ/sovlmDUw==
Received: from VI1EUR04FT003.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::4f) by
 VI1EUR04HT238.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::377)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Tue, 30 Mar
 2021 06:27:57 +0000
Received: from AM5PR0201MB2386.eurprd02.prod.outlook.com
 (2a01:111:e400:7e0e::4f) by VI1EUR04FT003.mail.protection.outlook.com
 (2a01:111:e400:7e0e::110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Tue, 30 Mar 2021 06:27:57 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:872B75C759B52DC8C16BB8471CB32A37062E85CD3EF0E8F7EE002673A10B1575;
 UpperCasedChecksum:415A7F47DDA2761A6D75E67A0A7EBC403612735B83AF2AB67E9F19638E27B2C3;
 SizeAsReceived:8410; Count:44
Received: from AM5PR0201MB2386.eurprd02.prod.outlook.com
 ([fe80::8ce:a38f:6ef9:3dd7]) by AM5PR0201MB2386.eurprd02.prod.outlook.com
 ([fe80::8ce:a38f:6ef9:3dd7%6]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 06:27:57 +0000
Date: Tue, 30 Mar 2021 08:27:50 +0200
Message-ID: <AM5PR0201MB23868ACFBFA07B794174E1DCB57D9@AM5PR0201MB2386.eurprd02.prod.outlook.com>
X-Android-Message-ID: <5b77309a-13e8-48c5-a1c3-309b68cba164@email.android.com>
From: georges1897@outlook.com
To: Nouveau@lists.freedesktop.org
X-TMN: [0WBR3BQldVFvQlT0++vkhYuBl/77dDYZ]
X-ClientProxiedBy: PR0P264CA0206.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::26) To AM5PR0201MB2386.eurprd02.prod.outlook.com
 (2603:10a6:203:33::8)
X-Microsoft-Original-Message-ID: <5b77309a-13e8-48c5-a1c3-309b68cba164@email.android.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [100.69.102.89] (193.57.125.106) by
 PR0P264CA0206.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.26 via Frontend Transport; Tue, 30 Mar 2021 06:27:56 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 44
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 98c0c4f9-45ff-4d24-44c6-08d8f344f514
X-MS-TrafficTypeDiagnostic: VI1EUR04HT238:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KDh8S+CQZd2zTX7OpEqiFU2TQujNpqW/VMMgbvCoA+5xHj+a8YPkNPV8/4SM4o3aZ67AzdCi/b3y6fQKVUl2r8ngVjpuNupZ4ZB7Rml5HJ4g9drub80ws71P+uxE8VsCBKMkWSNycMzPx6e7JkpJsv2rRaSRswy6mYLW5YUrQ6jUBkfjVjTlmltu6rEGQ3yxwqIIDV6t4D0Fzx6vOTrV+l1LOKdNivO+DSzpxR2twNKsxXfLOND2Q6eAfTdSxRkEhz5H3OFfUzSVflnkzwrvn88GipDgmyJUh4nXHDL67DQl3IpaBkxoLWvfYch6mxiTXKVAKzz02lz5qZepvcKNX5ElagdNh+xG7SCUP6Rcgj7jMEA622dSmScf6zoc8htwDJ+yum8YTsDGOCWtKbr4qw==
X-MS-Exchange-AntiSpam-MessageData: Yb4QzPNT2BiSg6/oCqi5WM+faONHNLCYwa49Zi3iCaVga7AzI1YlsWDzeNkOhZbodUMtpHj/oqJuc/6UrG3sxOSBhPzxlHOLE2UPvNBdEPzo+QUwZ5gymTakboNC4k+u8VTlIL43b5sn0XjaP03n5g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98c0c4f9-45ff-4d24-44c6-08d8f344f514
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 06:27:57.3454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR04FT003.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT238
Subject: [Nouveau] SLI support for nv44
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0698121336=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0698121336==
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJz
ZXQ9dXRmLTgiPjxkaXYgZGlyPSJhdXRvIj48ZGl2IGRpcj0iYXV0byI+SGksJm5ic3A7PC9kaXY+
PGRpdiBkaXI9ImF1dG8iPkkgYW0gY3VycmVudGx5IHRoZSBoYXBweSBvd25lciBvZiBhIG5mb3Jj
ZSA0IC0gU0xJIHdpdGggdHdvIDcxMDBncyBncmFwaGljcyBjYXJkcyBzZXR1cC4mbmJzcDs8L2Rp
dj48ZGl2IGRpcj0iYXV0byI+U2luY2UgSSd2ZSByZWFkIG9uIHlvdXIgZmVhdHVyZXMgbWF0cml4
IHRoYXQgc3VjaCBhIHNldHVwIGlzIHJhdGhlciB1bmNvbW1vbiBhbW9uZyBkZXZlbG9wZXJzLCBJ
IHdvdWxkIGxpa2UgdG8gaGVscCB5b3UgaW1wbGVtZW50aW5nIFNMSSBmb3Igb2xkIEdlRm9yY2Ug
Y2FyZHMgYXMgbXVjaCBhcyBJIGNhbi4gVGhlIGxhY2sgb2Ygc3VwcG9ydCBmb3IgbmV3ZXIga2Vy
bmVscyBmcm9tIE52aWRpYSBoYXMgaW5kZWVkIG1hZGUgbXkgc3lzdGVtIG9ic29sZXRlIChJIGRv
IGVuY291bnRlciBncmFwaGljYWwgZ2xpdGNoZXMgd2l0aCBtYW55IERFcykuPC9kaXY+PGRpdiBk
aXI9ImF1dG8iPkkgY2FuIHJ1biB0ZXN0cyB3aXRoIG15IGhhcmR3YXJlLCB0cnkgbmV3IGRyaXZl
cnMsIGFuZCBrbm93IHRoZSBiYXNpY3Mgb2YgQyBwcm9ncmFtbWluZyBpZiBuZWNlc3NhcnkuPC9k
aXY+PGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+SWYgeW91IHRoaW5r
IHRoYXQgSSBjb3VsZCBiZSBoZWxwZnVsIGluIGFueSB3YXksIGRvbid0IGhlc2l0YXRlIHRvIGNv
bnRhY3QgbWUgYmFjay48L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJh
dXRvIj5CZXN0IHJlZ2FyZHM8L2Rpdj48L2Rpdj4=

--===============0698121336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0698121336==--

Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 690B4A1ECC
	for <lists+nouveau@lfdr.de>; Thu, 29 Aug 2019 17:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82A46E15A;
	Thu, 29 Aug 2019 15:20:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on0611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe46::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D0089FC3;
 Mon, 26 Aug 2019 14:09:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJ2GHd9d+FFlEw5Hz6vBa1oeEJogQOuE2/kOQhSsLh8zr8kZxo+c6+h8yyAllnL+Tp8ZWWfOj2uNmGus0rt/m6K4Fz8nssae+0YJ3XpyrW5fml1D/uJ45k7jhx1cxMuXoDPbtfVfPdOpVYw6NTcVi/1qsnXJHJqVGqNum/ZMzDM/M3IdF2D/mViNTOtb72ydWJaM8nkP3G6ewoHg2R+1ofAxQD7IIKvVITAag81O6+QZzmiUkYRXmactuCsiXRL3B5Hgsgq8jVOhVyyvQ/mgG2OVUHF2abqF3Nhati/+ad/8wgmdxDtTwtFOhD+oyjKNBtYIyM6ztRT5ndb4I56+2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybGqdjEnP/Qtk+XTOS4rd2r5zmH/Rg1+UxiOHzAwvpQ=;
 b=MWdjAQdmHAfcE+qaPZOIsFwEHPjTYP/S4CrBIQZnTEdIrDt+YELp6vyXNCXsDdTx+5sxgoKzEHgTKKswTX+QLbbekYEW3xUoWjuUX4uBjKWEWIhUWKZVGcw5zNXoI4sAvIvxcmBcjSCmKQl2lMJRtKX+d7QVhXYAwn2ZJNXGLn00V+gIOz0jmWC9nwAtPgQ9VchHydRvwgSBTbUmJ0MLcc68nI643X125z+sgNCPk3pUb9kF0gqESoDO5FiRxKJRes9c6WGSFr71vkGCIyN1wszJly/DxudVO+FmIxbIlR6E2u2hpNdRtVkHxWy60x8UcRFshMkUlPD3Qe2xin2Apw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0071.namprd12.prod.outlook.com (2603:10b6:3:103::33)
 by DM6PR12MB2715.namprd12.prod.outlook.com (2603:10b6:5:4a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Mon, 26 Aug
 2019 14:09:24 +0000
Received: from BY2NAM03FT058.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by DM5PR12CA0071.outlook.office365.com
 (2603:10b6:3:103::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.15 via Frontend
 Transport; Mon, 26 Aug 2019 14:09:23 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT058.mail.protection.outlook.com (10.152.85.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 26 Aug 2019 14:09:23 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 26 Aug 2019 09:09:06 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>
Date: Mon, 26 Aug 2019 10:08:58 -0400
Message-ID: <20190826140903.12580-2-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826140903.12580-1-David.Francis@amd.com>
References: <20190826140903.12580-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(346002)(2980300002)(428003)(189003)(199004)(86362001)(478600001)(5660300002)(36756003)(186003)(1076003)(26005)(8676002)(11346002)(81166006)(336012)(476003)(81156014)(70586007)(126002)(70206006)(2616005)(486006)(47776003)(6916009)(49486002)(16586007)(50226002)(50466002)(316002)(48376002)(2351001)(305945005)(426003)(446003)(2906002)(8936002)(4326008)(54906003)(76176011)(51416003)(53936002)(6666004)(356004)(450100002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2715; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8a1e073-2420-4b13-cb55-08d72a2eff10
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM6PR12MB2715; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2715:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2715BF7343A9DBCAB81ADFE5EFA10@DM6PR12MB2715.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: /v0cvqgS3ZvXQU7QzTlIYZu7SBugrL3OJOg/yogz3Ajvy7NJVGjJfC+13MT3s0RInu0KLkb7z7B9eeKtqL1/f/KLDv1Gh8VFJCkPPQ/SAzI6ySvvNyeFTQIQBEV3lhAEmu/MCQq+2Hgs6m7NpzobeVocxMM9Icz+VEEaADaEQw6OoC2fOwAiTJLOGBKSrE6hgPhZ+/tnPOj4rbY9Lft8qPs/C1bYq9YGOOykMpJHhScSh22fUcybKDUfELjyE9lmtwBo2uSGbV0hSftQ48k2tQ/1kMrORHTrVzi616hjPuY44MQPY1IkvP5zIGPejoIozS8mjyBRu1jHwdbHq0g6ReG0uK2DkD0XxrSE3N8WYS2bqMmbqtHuU+BG8f8S9XlMXmkBeVpXhIKeut6LGjgKKEDRqmFFn+H3I/brH+8tKs8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 14:09:23.0115 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a1e073-2420-4b13-cb55-08d72a2eff10
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2715
X-Mailman-Approved-At: Thu, 29 Aug 2019 15:20:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybGqdjEnP/Qtk+XTOS4rd2r5zmH/Rg1+UxiOHzAwvpQ=;
 b=S4EMZvWLgwSGY7m4oCrSUE8GFwXFJWkwkkhsixKGnsh2A9E/HdLJZIf1Sq82V35q0xIO9/aDp8c0RwmOZzQvT/9bwFKd2YKJhG3hcGxNncS4FUNW+rFd3AmX7NzQFN4EkT6Ny6hRaxfcCizDmP8piqjJWa0K/0AI4h2ndEA9VzI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Subject: [Nouveau] [PATCH v6 1/6] drm/dp_mst: Add PBN calculation for DSC
 modes
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: nouveau@lists.freedesktop.org, David Francis <David.Francis@amd.com>,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

V2l0aCBEU0MsIGJwcCBjYW4gYmUgZnJhY3Rpb25hbCBpbiBtdWx0aXBsZXMgb2YgMS8xNi4KCkNo
YW5nZSBkcm1fZHBfY2FsY19wYm5fbW9kZSB0byByZWZsZWN0IHRoaXMsIGFkZGluZyBhIG5ldwpw
YXJhbWV0ZXIgYm9vbCBkc2MuIFdoZW4gdGhpcyBwYXJhbWV0ZXIgaXMgdHJ1ZSwgdHJlYXQgdGhl
CmJwcCBwYXJhbWV0ZXIgYXMgaGF2aW5nIHVuaXRzIG5vdCBvZiBiaXRzIHBlciBwaXhlbCwgYnV0
CjEvMTYgb2YgYSBiaXQgcGVyIHBpeGVsCgp2MjogRG9uJ3QgYWRkIHNlcGFyYXRlIGZ1bmN0aW9u
IGZvciB0aGlzCgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IG5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
ClJldmlld2VkLWJ5OiBNYW5hc2kgTmF2YXJlIDxtYW5hc2kuZC5uYXZhcmVAaW50ZWwuY29tPgpS
ZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTog
RGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPgotLS0KIC4uLi9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYyAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX21zdF90b3BvbG9neS5jICAgICAgICAgICAgfCAxNiArKysrKysrKysrKystLS0t
CiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jICAgICAgfCAgMiAr
LQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jICAgICAgICAgIHwgIDIg
Ky0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2RwX21zdC5jICAgICAgICAgICB8ICAy
ICstCiBpbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oICAgICAgICAgICAgICAgICAgfCAg
MyArLS0KIDYgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG1faGVscGVycy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG1faGVscGVycy5jCmluZGV4IGEwZWQwMTU0YTlmMC4uYWJhZmI1MjIxYjQ0IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9o
ZWxwZXJzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG1faGVscGVycy5jCkBAIC0yMzUsNyArMjM1LDcgQEAgYm9vbCBkbV9oZWxwZXJzX2RwX21z
dF93cml0ZV9wYXlsb2FkX2FsbG9jYXRpb25fdGFibGUoCiAKIAkJLyogVE9ETyBuZWVkIHRvIGtu
b3cgbGluayByYXRlICovCiAKLQkJcGJuID0gZHJtX2RwX2NhbGNfcGJuX21vZGUoY2xvY2ssIGJw
cCk7CisJCXBibiA9IGRybV9kcF9jYWxjX3Bibl9tb2RlKGNsb2NrLCBicHAsIGZhbHNlKTsKIAog
CQlzbG90cyA9IGRybV9kcF9maW5kX3ZjcGlfc2xvdHMobXN0X21nciwgcGJuKTsKIAkJcmV0ID0g
ZHJtX2RwX21zdF9hbGxvY2F0ZV92Y3BpKG1zdF9tZ3IsIG1zdF9wb3J0LCBwYm4sIHNsb3RzKTsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IDgyYWRkNzM2ZTE3ZC4uM2U3
Yjc1NTNjZjRkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9n
eS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTM1MzQs
MTAgKzM1MzQsMTEgQEAgRVhQT1JUX1NZTUJPTChkcm1fZHBfY2hlY2tfYWN0X3N0YXR1cyk7CiAg
KiBkcm1fZHBfY2FsY19wYm5fbW9kZSgpIC0gQ2FsY3VsYXRlIHRoZSBQQk4gZm9yIGEgbW9kZS4K
ICAqIEBjbG9jazogZG90IGNsb2NrIGZvciB0aGUgbW9kZQogICogQGJwcDogYnBwIGZvciB0aGUg
bW9kZS4KKyAqIEBkc2M6IERTQyBtb2RlLiBJZiB0cnVlLCBicHAgaGFzIHVuaXRzIG9mIDEvMTYg
b2YgYSBiaXQgcGVyIHBpeGVsCiAgKgogICogVGhpcyB1c2VzIHRoZSBmb3JtdWxhIGluIHRoZSBz
cGVjIHRvIGNhbGN1bGF0ZSB0aGUgUEJOIHZhbHVlIGZvciBhIG1vZGUuCiAgKi8KLWludCBkcm1f
ZHBfY2FsY19wYm5fbW9kZShpbnQgY2xvY2ssIGludCBicHApCitpbnQgZHJtX2RwX2NhbGNfcGJu
X21vZGUoaW50IGNsb2NrLCBpbnQgYnBwLCBib29sIGRzYykKIHsKIAl1NjQga2JwczsKIAlzNjQg
cGVha19rYnBzOwpAQCAtMzU1NSwxMSArMzU1NiwxOCBAQCBpbnQgZHJtX2RwX2NhbGNfcGJuX21v
ZGUoaW50IGNsb2NrLCBpbnQgYnBwKQogCSAqIHBlYWtfa2JwcyAqPSAoMTAwNi8xMDAwKQogCSAq
IHBlYWtfa2JwcyAqPSAoNjQvNTQpCiAJICogcGVha19rYnBzICo9IDggICAgY29udmVydCB0byBi
eXRlcworCSAqCisJICogSWYgdGhlIGJwcCBpcyBpbiB1bml0cyBvZiAxLzE2LCBmdXJ0aGVyIGRp
dmlkZSBieSAxNi4gUHV0IHRoaXMKKwkgKiBmYWN0b3IgaW4gdGhlIG51bWVyYXRvciByYXRoZXIg
dGhhbiB0aGUgZGVub21pbmF0b3IgdG8gYXZvaWQKKwkgKiBpbnRlZ2VyIG92ZXJmbG93CiAJICov
CiAKIAludW1lcmF0b3IgPSA2NCAqIDEwMDY7CiAJZGVub21pbmF0b3IgPSA1NCAqIDggKiAxMDAw
ICogMTAwMDsKIAorCWlmIChkc2MpCisJCW51bWVyYXRvciAvPSAxNjsKKwogCWticHMgKj0gbnVt
ZXJhdG9yOwogCXBlYWtfa2JwcyA9IGRybV9maXhwX2Zyb21fZnJhY3Rpb24oa2JwcywgZGVub21p
bmF0b3IpOwogCkBAIC0zNTcwLDE5ICszNTc4LDE5IEBAIEVYUE9SVF9TWU1CT0woZHJtX2RwX2Nh
bGNfcGJuX21vZGUpOwogc3RhdGljIGludCB0ZXN0X2NhbGNfcGJuX21vZGUodm9pZCkKIHsKIAlp
bnQgcmV0OwotCXJldCA9IGRybV9kcF9jYWxjX3Bibl9tb2RlKDE1NDAwMCwgMzApOworCXJldCA9
IGRybV9kcF9jYWxjX3Bibl9tb2RlKDE1NDAwMCwgMzAsIGZhbHNlKTsKIAlpZiAocmV0ICE9IDY4
OSkgewogCQlEUk1fRVJST1IoIlBCTiBjYWxjdWxhdGlvbiB0ZXN0IGZhaWxlZCAtIGNsb2NrICVk
LCBicHAgJWQsIGV4cGVjdGVkIFBCTiAlZCwgYWN0dWFsIFBCTiAlZC5cbiIsCiAJCQkJMTU0MDAw
LCAzMCwgNjg5LCByZXQpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9Ci0JcmV0ID0gZHJtX2RwX2Nh
bGNfcGJuX21vZGUoMjM0MDAwLCAzMCk7CisJcmV0ID0gZHJtX2RwX2NhbGNfcGJuX21vZGUoMjM0
MDAwLCAzMCwgZmFsc2UpOwogCWlmIChyZXQgIT0gMTA0NykgewogCQlEUk1fRVJST1IoIlBCTiBj
YWxjdWxhdGlvbiB0ZXN0IGZhaWxlZCAtIGNsb2NrICVkLCBicHAgJWQsIGV4cGVjdGVkIFBCTiAl
ZCwgYWN0dWFsIFBCTiAlZC5cbiIsCiAJCQkJMjM0MDAwLCAzMCwgMTA0NywgcmV0KTsKIAkJcmV0
dXJuIC1FSU5WQUw7CiAJfQotCXJldCA9IGRybV9kcF9jYWxjX3Bibl9tb2RlKDI5NzAwMCwgMjQp
OworCXJldCA9IGRybV9kcF9jYWxjX3Bibl9tb2RlKDI5NzAwMCwgMjQsIGZhbHNlKTsKIAlpZiAo
cmV0ICE9IDEwNjMpIHsKIAkJRFJNX0VSUk9SKCJQQk4gY2FsY3VsYXRpb24gdGVzdCBmYWlsZWQg
LSBjbG9jayAlZCwgYnBwICVkLCBleHBlY3RlZCBQQk4gJWQsIGFjdHVhbCBQQk4gJWQuXG4iLAog
CQkJCTI5NzAwMCwgMjQsIDEwNjMsIHJldCk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcF9tc3QuYwppbmRleCAyYzVhYzNkZDY0N2YuLjRmMTdmNjFmNDQ1MyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jCkBAIC02MSw3ICs2MSw3
IEBAIHN0YXRpYyBpbnQgaW50ZWxfZHBfbXN0X2NvbXB1dGVfbGlua19jb25maWcoc3RydWN0IGlu
dGVsX2VuY29kZXIgKmVuY29kZXIsCiAJCWNydGNfc3RhdGUtPnBpcGVfYnBwID0gYnBwOwogCiAJ
CWNydGNfc3RhdGUtPnBibiA9IGRybV9kcF9jYWxjX3Bibl9tb2RlKGFkanVzdGVkX21vZGUtPmNy
dGNfY2xvY2ssCi0JCQkJCQkgICAgICAgY3J0Y19zdGF0ZS0+cGlwZV9icHApOworCQkJCQkJICAg
ICAgIGNydGNfc3RhdGUtPnBpcGVfYnBwLCBmYWxzZSk7CiAKIAkJc2xvdHMgPSBkcm1fZHBfYXRv
bWljX2ZpbmRfdmNwaV9zbG90cyhzdGF0ZSwgJmludGVsX2RwLT5tc3RfbWdyLAogCQkJCQkJICAg
ICAgcG9ydCwgY3J0Y19zdGF0ZS0+cGJuKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUw
L2Rpc3AuYwppbmRleCA1YzM2Yzc1MjMyZTYuLmM2ODc4M2MxZjNmYSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwpAQCAtNzgyLDcgKzc4Miw3IEBAIG52NTBfbXN0b19h
dG9taWNfY2hlY2soc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAogCQkJY29uc3QgaW50IGJw
cCA9IGNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLmJwYyAqIDM7CiAJCQljb25zdCBpbnQgY2xvY2sg
PSBjcnRjX3N0YXRlLT5hZGp1c3RlZF9tb2RlLmNsb2NrOwogCi0JCQlhc3loLT5kcC5wYm4gPSBk
cm1fZHBfY2FsY19wYm5fbW9kZShjbG9jaywgYnBwKTsKKwkJCWFzeWgtPmRwLnBibiA9IGRybV9k
cF9jYWxjX3Bibl9tb2RlKGNsb2NrLCBicHAsIGZhbHNlKTsKIAkJfQogCiAJCXNsb3RzID0gZHJt
X2RwX2F0b21pY19maW5kX3ZjcGlfc2xvdHMoc3RhdGUsICZtc3RtLT5tZ3IsCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcF9tc3QuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2RwX21zdC5jCmluZGV4IDI5OTRmMDdmYmFkOS4uYzk5N2Y4ODIxOGYy
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcF9tc3QuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcF9tc3QuYwpAQCAtNTE0LDcgKzUxNCw3
IEBAIHN0YXRpYyBib29sIHJhZGVvbl9tc3RfbW9kZV9maXh1cChzdHJ1Y3QgZHJtX2VuY29kZXIg
KmVuY29kZXIsCiAKIAltc3RfZW5jID0gcmFkZW9uX2VuY29kZXItPmVuY19wcml2OwogCi0JbXN0
X2VuYy0+cGJuID0gZHJtX2RwX2NhbGNfcGJuX21vZGUoYWRqdXN0ZWRfbW9kZS0+Y2xvY2ssIGJw
cCk7CisJbXN0X2VuYy0+cGJuID0gZHJtX2RwX2NhbGNfcGJuX21vZGUoYWRqdXN0ZWRfbW9kZS0+
Y2xvY2ssIGJwcCwgZmFsc2UpOwogCiAJbXN0X2VuYy0+cHJpbWFyeS0+YWN0aXZlX2RldmljZSA9
IG1zdF9lbmMtPnByaW1hcnktPmRldmljZXMgJiBtc3RfZW5jLT5jb25uZWN0b3ItPmRldmljZXM7
CiAJRFJNX0RFQlVHX0tNUygic2V0dGluZyBhY3RpdmUgZGV2aWNlIHRvICUwOHggZnJvbSAlMDh4
ICUwOHggZm9yIGVuY29kZXIgJWRcbiIsCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBf
bXN0X2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaAppbmRleCAyYmE2
MjUzZWE2ZDMuLjkxMTZiMmM5NTIzOSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX21z
dF9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCkBAIC02MTAs
OCArNjEwLDcgQEAgYm9vbCBkcm1fZHBfbXN0X3BvcnRfaGFzX2F1ZGlvKHN0cnVjdCBkcm1fZHBf
bXN0X3RvcG9sb2d5X21nciAqbWdyLAogc3RydWN0IGVkaWQgKmRybV9kcF9tc3RfZ2V0X2VkaWQo
c3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rvciwgc3RydWN0IGRybV9kcF9tc3RfdG9wb2xv
Z3lfbWdyICptZ3IsIHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpOwogCiAKLWludCBkcm1f
ZHBfY2FsY19wYm5fbW9kZShpbnQgY2xvY2ssIGludCBicHApOwotCitpbnQgZHJtX2RwX2NhbGNf
cGJuX21vZGUoaW50IGNsb2NrLCBpbnQgYnBwLCBib29sIGRzYyk7CiAKIGJvb2wgZHJtX2RwX21z
dF9hbGxvY2F0ZV92Y3BpKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAogCQkJ
ICAgICAgc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydCwgaW50IHBibiwgaW50IHNsb3RzKTsK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

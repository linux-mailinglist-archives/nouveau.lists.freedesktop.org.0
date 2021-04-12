Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 012F535D0C3
	for <lists+nouveau@lfdr.de>; Mon, 12 Apr 2021 21:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8CD89D39;
	Mon, 12 Apr 2021 19:06:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770078.outbound.protection.outlook.com [40.107.77.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507B989D39
 for <nouveau@lists.freedesktop.org>; Mon, 12 Apr 2021 19:06:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THCGG4z5Hv2dDZ4BrQ2JC+IRFaWimfaVrW4aIEGdPBl1+LMZYsrahj81C0ePgI59e22pHHyDdktK2Houwh6SR9+dJs/cZwngSfbeKpgHEIOnjlp4bxuLLyTQyiYhW3FyBaVIgloYZogp2kFRNcZmHjhjBUbwIIuWllJZ0iw0OC9UfaMonL2ZjYf3aIR0muBLkqdvisk6b7v1/6kWtyU69l28fZY9F2GwNxuSiqFIALfsFN+Y/fu/P41L0NFJbGZpfH6i+pQDUIsBhQ4Ljak5zcUppSWjwoO/DI9i+mIe2QQ5ILwE13+b6SW8xns4jU5H9DGp9DyWKaQxZbUX/hHrGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AsCsHVaLb8Lc3tX5ttjfVbe+p8TxXyI5VcwSxGS5hjg=;
 b=fEQQLoBaGqBc6xcxwbSFaMsuQtoCtrOuYxRnBkVvekAKjnQWtr8Go6cyyEyQIHdM8wcsw5Wn6TNeUNVirvNY3ZklO1oftIs/s+jG74arne4ksCG2APGD+5y8no/9+btIifqHejlTZCS75ZDY4AtopPzeaJ1UHb2jjpEcd3O36wKkiPzncZELajK+9eioY6VohaFj8vlVW6SkMl/V82ZQGaJigafFpopfJaFpX5tWzbzn1JJact80pNOzeKSDuOYN+GG9t6MtYOpYBGYxFu3jktBzwcnI2+cGfg9z+1gxqnCVr2PkHjoM2IOMIlXt5sHySVY5CTFh3n9JK5UoLcxXFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AsCsHVaLb8Lc3tX5ttjfVbe+p8TxXyI5VcwSxGS5hjg=;
 b=L33lqhe/p9b1236FfoUoBcjuuFBSFnULY4kfdQct2SUFLXjFXjES1NDJXiJpuw+jFJ1drdJ0VtRJs+345KsfuU8lyLCzryHg84A7Qq3Dedv/drYAeBIrm7ftDRn2kNCRU7rA7J/9Tf/8GBYDAIsbnQNlXx3rwCJrfDT97GLxnlvyfsg3f1E0pAXigSKlG0pQ7gVJkkpxbiFBXNfFzqEQed0jVjGoWg5qLZygjYzTwQe4j536OjVgoILdG+qAAdirRckLa51gCkCisBKp43GWVRBa2Xny4/+NkVrBMCNr380P3DpjF0ZVTE3kHSc0ihLuPco/1AnQZi8PlP77Gz8d/w==
Received: from DM5PR15CA0030.namprd15.prod.outlook.com (2603:10b6:4:4b::16) by
 MN2PR12MB3406.namprd12.prod.outlook.com (2603:10b6:208:c9::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21; Mon, 12 Apr 2021 19:06:29 +0000
Received: from DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:4b:cafe::a5) by DM5PR15CA0030.outlook.office365.com
 (2603:10b6:4:4b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Mon, 12 Apr 2021 19:06:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linux.intel.com; dkim=none (message not signed)
 header.d=none; linux.intel.com; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT010.mail.protection.outlook.com (10.13.172.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4020.17 via Frontend Transport; Mon, 12 Apr 2021 19:06:29 +0000
Received: from treble.plattner.fun (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Apr
 2021 19:06:28 +0000
To: Roy Spliet <nouveau@spliet.org>, Lukas Wunner <lukas@wunner.de>
References: <CAAd53p6Ef2zFX_t3y1c6O7BmHnxYGtGSfgzXAMQSom1ainWXzg@mail.gmail.com>
 <s5hsg85n2km.wl-tiwai@suse.de> <s5hmtydn0yg.wl-tiwai@suse.de>
 <CAAd53p6MMFh=HCNF9pyrJc9hVMZWFe7_8MvBcBHVWARqHU_TTA@mail.gmail.com>
 <s5h7dpfk06y.wl-tiwai@suse.de>
 <CAAd53p53w0H6tsb4JgQtFTkYinniicTYBs2uk7tc=heP2dM_Cw@mail.gmail.com>
 <CAKb7UvjWX7xbwMKtnad5EVy16nY1M-A13YJeRWyUwHzemcVswA@mail.gmail.com>
 <CAAd53p4=bSX26QzsPyV1sxADiuVn2sowWyb5JFDoPZQ+ZYoCzA@mail.gmail.com>
 <CACO55tsPx_UC3OPf9Hq9sGdnZg9jH1+B0zOi6EAxTZ13E1tf7A@mail.gmail.com>
 <d01e375f-bf16-a005-ec66-0910956cc616@spliet.org>
 <20210410192314.GB16240@wunner.de>
 <bddba2ca-15d5-7fd3-5b64-f4ba7e179ec0@spliet.org>
From: Aaron Plattner <aplattner@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <81b2a8c7-5b0b-b8fa-fbed-f164128de7a3@nvidia.com>
Date: Mon, 12 Apr 2021 12:06:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <bddba2ca-15d5-7fd3-5b64-f4ba7e179ec0@spliet.org>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8c0cace-b1c5-4466-7c69-08d8fde613fd
X-MS-TrafficTypeDiagnostic: MN2PR12MB3406:
X-Microsoft-Antispam-PRVS: <MN2PR12MB340650AA121698337DB672EDCD709@MN2PR12MB3406.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jWsJoa3VvrtGILD9VnaEynscIvaXaSJnJNz3S0103wTsOS8RyaJrlFIsamJJDzqYK9wLl5ZCqyC43rudutLT+aWvxJXhamkc9/I1Dt87KIAdQKPshOgdOkOsjMjTG025PEa+OiR9j2n6AVCvVatzGGZZEQGdYF2YsvdwbDzzInucYyCwCprCbOUKG2+dS4tUIrDb7kl2daN55wqhfk5fznyEBdtvF0mjxiHndT4D4Wuz+v8u2vVxscsxFbdgseF/MsaOVjJhtD/QIh5iRBu78c4/3XduPqUlbt1s7ecKflUQScEtCQcDTsYjQoijahyAWhDLcUkWjIO6fYcpjI9d8ZAyEx1lzZIDFcggHxrtovglpmK1grXJSHapPKObmxZLNd+3kJWCg8NXplr+JzBGshr7l/kLT+L84PxiqJyMxWfrKJewWszcoRHzKJQ1rIFtwssVu//heMumqHOcdDbxtxbEfu40oKm1SrUMi2fosiec+6Qa6Wv9IW1j96YMO7WXtF1zXeENffgQvlmMhj4A5UkBsqWm4PZRmu/lArT4CDyXdl/63Zk97Ay5ke/SAqhy6/BrCxCeN5zDSyoWQHtIXmo8ChLHEwT1iTLicn4NYI14FRjupcBY/SOtpbrdgUK8D3MPRn3PmzNvSNonXa3bNNDwBbjPrLt2GrQnEnSYLrVwvLEduL4EWIn5FWlbEZZddR3xHiO8SojYVztF1vMT16+TgdIvLiEzaTEb4jnaqhw7klHYKn98DxGz33iid4W4suwxpKR8EUkwaLSk9hW6dQ==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966006)(36840700001)(31686004)(110136005)(16526019)(8676002)(86362001)(70206006)(316002)(478600001)(7636003)(186003)(8936002)(2906002)(82310400003)(36906005)(966005)(82740400003)(53546011)(36756003)(7416002)(83380400001)(26005)(336012)(54906003)(47076005)(2616005)(31696002)(5660300002)(70586007)(4326008)(356005)(36860700001)(426003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 19:06:29.1540 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c0cace-b1c5-4466-7c69-08d8fde613fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3406
Subject: Re: [Nouveau] [PATCH v2] ALSA: hda: Continue to probe when codec
 probe fails
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
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 nouveau <nouveau@lists.freedesktop.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Alan Stern <stern@rowland.harvard.edu>, Linux PCI <linux-pci@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Jaroslav Kysela <perex@perex.cz>,
 Mike Rapoport <rppt@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gNC8xMC8yMSAxOjQ4IFBNLCBSb3kgU3BsaWV0IHdyb3RlOgo+IE9wIDEwLTA0LTIwMjEgb20g
MjA6MjMgc2NocmVlZiBMdWthcyBXdW5uZXI6Cj4+IE9uIFNhdCwgQXByIDEwLCAyMDIxIGF0IDA0
OjUxOjI3UE0gKzAxMDAsIFJveSBTcGxpZXQgd3JvdGU6Cj4+PiBDYW4gSSBhc2sgc29tZW9uZSB3
aXRoIG1vcmUKPj4+IHRlY2huaWNhbCBrbm93bGVkZ2Ugb2Ygc25kX2hkYV9pbnRlbCBhbmQgdmdh
c3dpdGNoZXJvbyB0byBicmFpbnN0b3JtIAo+Pj4gYWJvdXQKPj4+IHRoZSBwb3NzaWJsZSBjaGFs
bGVuZ2VzIG9mIG5vdXZlYXUgdGFraW5nIG1hdHRlcnMgaW50byBpdHMgb3duIGhhbmQgCj4+PiBy
YXRoZXIKPj4+IHRoYW4ga2VlcGluZyB0aGlzIFBDSSBxdWlyayBhcm91bmQ/Cj4+Cj4+IEl0IHNv
dW5kcyB0byBtZSBsaWtlIHRoZSBIREEgaXMgbm90IHBvd2VyZWQgaWYgbm8gY2FibGUgaXMgcGx1
Z2dlZCBpbi4KPj4gV2hhdCBpcyByZXBvbnNpYmxlIHRoZW4gZm9yIHBvd2VyaW5nIGl0IHVwIG9y
IGRvd24sIGZpcm13YXJlIGNvZGUgb24KPj4gdGhlIEdQVSBvciBpbiB0aGUgaG9zdCdzIEJJT1M/
Cj4gCj4gU29tZXRpbWVzIHRoZSBCSU9TLCBidXQgZGVmaW5pdGVseSB1bmNvbmRpdGlvbmFsbHkg
dGhlIFBDSSBxdWlyayBjb2RlOiAKPiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgv
YmxvYi9tYXN0ZXIvZHJpdmVycy9wY2kvcXVpcmtzLmMjTDUyODkKPiAKPiAoQ0MgQWFyb24gUGxh
dHRuZXIpCgpNeSBiYXNpYyB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhlIGF1ZGlvIGZ1bmN0aW9u
IHN0b3BzIHJlc3BvbmRpbmcgCndoZW5ldmVyIHRoZSBncmFwaGljcyBmdW5jdGlvbiBpcyBwb3dl
cmVkIG9mZi4gU28gdGhlIHJlcXVpcmVtZW50IGhlcmUgCmlzIHRoYXQgdGhlIGF1ZGlvIGRyaXZl
ciBjYW4ndCB0cnkgdG8gdGFsayB0byB0aGUgYXVkaW8gZnVuY3Rpb24gd2hpbGUgCnRoZSBncmFw
aGljcyBmdW5jdGlvbiBpcyBhc2xlZXAsIGFuZCBtdXN0IHRyaWdnZXIgYSBncmFwaGljcyBmdW5j
dGlvbiAKd2FrZXVwIGJlZm9yZSB0cnlpbmcgdG8gY29tbXVuaWNhdGUgd2l0aCB0aGUgYXVkaW8g
ZnVuY3Rpb24uIEkgdGhpbmsgCnRoZXJlIGFyZSBhbHNvIHJlcXVpcmVtZW50cyBhYm91dCB0aGUg
YXVkaW8gZnVuY3Rpb24gbmVlZGluZyB0byBiZSBhd2FrZSAKd2hlbiB0aGUgZ3JhcGhpY3MgZHJp
dmVyIGlzIHVwZGF0aW5nIHRoZSBFTEQsIGJ1dCBJJ20gbm90IHN1cmUuCgpUaGlzIGlzIGhhcmRl
ciBvbiBXaW5kb3dzIGJlY2F1c2UgdGhlIGF1ZGlvIGRyaXZlciBsaXZlcyBpbiBpdHMgb3duIAps
aXR0bGUgd29ybGQgZG9pbmcgaXRzIG93biB0aGluZyBidXQgb24gTGludXggd2UgY2FuIGRvIGJl
dHRlci4KCj4+IElkZWFsbHksIHdlIHNob3VsZCB0cnkgdG8gZmluZCBvdXQgaG93IHRvIGNvbnRy
b2wgSERBIHBvd2VyIGZyb20gdGhlCj4+IG9wZXJhdGluZyBzeXN0ZW0gcmF0aGVyIHRoYW4gdHJ5
aW5nIHRvIGNvb3BlcmF0ZSB3aXRoIHdoYXRldmVyIGZpcm13YXJlCj4+IGlzIGRvaW5nLsKgIElm
IHdlIGhhdmUgdGhhdCBjYXBhYmlsaXR5LCB0aGUgT1Mgc2hvdWxkIHBvd2VyIHRoZSBIREEgdXAK
Pj4gYW5kIGRvd24gYXMgaXQgc2VlcyBmaXQuCgpBZnRlciBzeXN0ZW0gYm9vdCwgSSBkb24ndCB0
aGluayB0aGVyZSdzIGFueSBmaXJtd2FyZSBpbnZvbHZlZCwgYnV0IEknbSAKbm90IHN1cGVyIGZh
bWlsaWFyIHdpdGggdGhlIGxvdy1sZXZlbCBkZXRhaWxzIGFuZCBpdCdzIHBvc3NpYmxlIHRoZSAK
c2l0dWF0aW9uIGNoYW5nZWQgc2luY2UgSSBsYXN0IGxvb2tlZCBhdCBpdC4KCkkgdGhpbmsgdGhl
IHByb2JsZW0gd2l0aCBoYXZpbmcgbm91dmVhdSB3cml0ZSB0aGlzIHF1aXJrIGlzIHRoYXQgdGhl
IAprZXJuZWwgd2lsbCBuZWVkIHRvIHJlLXByb2JlIHRoZSBQQ0kgZGV2aWNlIHRvIG5vdGljZSB0
aGF0IGl0IGhhcyAKc3VkZGVubHkgYmVjb21lIGEgbXVsdGktZnVuY3Rpb24gZGV2aWNlIHdpdGgg
YW4gYXVkaW8gZnVuY3Rpb24sIGFuZCAKaG90cGx1ZyB0aGUgYXVkaW8gZHJpdmVyLiBJIG9yaWdp
bmFsbHkgbG9va2VkIGludG8gdHJ5aW5nIHRvIGRvIHRoYXQgYnV0IAppdCB3YXMgdHJpY2t5IGJl
Y2F1c2UgdGhlIFBDSSBzdWJzeXN0ZW0gZGlkbid0IHJlYWxseSBoYXZlIGEgbWVjaGFuaXNtIApm
b3IgYSBzaW5nbGUtZnVuY3Rpb24gZGV2aWNlIHRvIGJlY29tZSBhIG11bHRpLWZ1bmN0aW9uIGRl
dmljZSBvbiB0aGUgCmZseSBhbmQgaXQgc2VlbWVkIGVhc2llciB0byBlbmFibGUgaXQgZWFybHkg
b24gZHVyaW5nIGJ1cyBlbnVtZXJhdGlvbi4gClRoYXQgd2F5IHRoZSBrZXJuZWwgc2VlcyBib3Ro
IGZ1bmN0aW9ucyBhbGwgdGhlIHRpbWUgd2l0aG91dCBhbnl0aGluZyAKZWxzZSBoYXZpbmcgdG8g
YmUgc3BlY2lhbCBhYm91dCB0aGlzIGNvbmZpZ3VyYXRpb24uCgotLSBBYXJvbgoKPj4gVGhhbmtz
LAo+Pgo+PiBMdWthcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

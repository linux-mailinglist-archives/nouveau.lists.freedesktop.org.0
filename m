Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6AB3CFBB0
	for <lists+nouveau@lfdr.de>; Tue, 20 Jul 2021 16:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D852A6E3F4;
	Tue, 20 Jul 2021 14:12:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AD86E3F4;
 Tue, 20 Jul 2021 14:12:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpCiUvhLx5OLsvXTGTuCymKJpz4s0r014oIHmpXBNBjrecVT8SZXfIijaVP/pBbFRnUxFCotfdh5mwsQaY5y13PsCZsHBZQkd4sWoAnwBHppoA6DSljv+izLfbgQ4ULHhSvCzhD8Ml+9Ff7n2dEb2PpV5ykCK3aYD6m6EDcxAnoYklnqP0qougurL8yrYGq0xi508hDlIp88rYjBJj25V9foPaum4TlF8op91+jnE/bgqDbCfdaqFKT/mRw2Jt9DN0d6V5nlC2ieQAno2EcplyjsP537Li+H3Kp2/whGsiOgyFA806XDgeqvKxc49nwOt7JBxmQVKPHZ1d1ByQXrlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UG+tW3XN0U8V8DN0N/6vJ6TL6+v4JJo4WujEsfL1CJo=;
 b=WoCbvvCkKiOguWWUwvMWWe/MYBGEg2upIjtraDng/rsWTk2/kx0ZfgH3qX1a6IL0/JBhU0M3NIKXmNpIZnfH8QVRavOLFWk7/TbQPDdW8RIhkRqWPGwpk09+MleZE8vAUmy+uaCYkohkT5ExdfuckG7Z5xpQateev1YdioUIhdt9KBjM+wh+X0ZjqewJ5rPVONwXvynSzy8N5xxko6whL1Aa6Ld7Wl48TbPA2VC9mjYVNygKuJZM3KmI7xUoFfS3e4EQ8VxPPHjRD5u+3dTez6mPQOi4uki27vIYD4Keq+Zvo5gAsGF7wXREIxSTwFMTkqXtfvSdTGUbEedvnXxsiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UG+tW3XN0U8V8DN0N/6vJ6TL6+v4JJo4WujEsfL1CJo=;
 b=LQ/whawcqfyg08aZE1OmzJRj1A8fl7bMmWSpkwSR/kKcRR0cH4mYLDIbgA0fwFDxnfHjImV2cyltnFghgF2kn5EMLttEB7ewLimcra6wV7GumDGHcJkmmKofJQMZ68cT84mYb5Ata2idgo87bTDh/8J624wT0bt7sNsIIYOudhA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4374.namprd12.prod.outlook.com (2603:10b6:208:266::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 14:12:14 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 14:12:14 +0000
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210716061634.2446357-1-hch@lst.de>
 <20210716061634.2446357-2-hch@lst.de>
 <f171831b-3281-5a5a-04d3-2d69cb77f1a2@amd.com>
 <YPbUvIYmu3WfyM2C@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b846ec6e-dc9a-dfb5-a854-d819a4978322@amd.com>
Date: Tue, 20 Jul 2021 16:12:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YPbUvIYmu3WfyM2C@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0076.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8651:5b5e:8648:2fd0]
 (2a02:908:1252:fb60:8651:5b5e:8648:2fd0) by
 PR0P264CA0076.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 14:12:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37138ed6-02b7-4faf-0240-08d94b885f7f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4374B5A57E0847871BA0CA7A83E29@MN2PR12MB4374.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qzONWVKxrl5UQf66w4oSeCBbqtkT/I/+/qLT5fUHUCLF34ZNoVhRs+hIw0hB6fNjaw6L6mvp4G0q62ufSQIwf2O4oHa+97rN2Cpn9dboHiWEsn7WBMzXPId5qi10xV6WTYuBg6A9LTlAD/LFfpTiZ81PL7Ui1odh8Jy94ypcBwR7PzY90QTyzBiplV4EoWbHdb5NbjHkwDPT6uxN0FaMj7ttqapj3z1JlK2TfIV0pa/vEUCSywJ1znuh/Qz1rf4NMP+mJNYgt/H05JkO46LVAe5pUiJzKGItqclt0pfG6hg4vu9D7BZg2BvHM4ZZRvdwcHEjuZpeglcNbtrDYdnu155RPj9TU70tPKCthI/Ra+2GYUYdEV1C83o59RaEzI3vsbUoqqbNV0B+Y1s1woi+Ir29aTqNWXbQRw0Jt44BbmyuAq4p/GKAPPLjXvpRr91e+8loBIhzLHFLADyZYD6Rpqc1RrXP+LMH5xZ8IsqbE5al8m4Zq3d2R025bqMqdkcnv4PKvLPEDfNGW0RlDNMtk3YtLfrjSeA4w/UK278E8Cq+tj8NJpYvztScS6D3axQ7Fl9sklNAsBouKoIf6QIXJbvD+pLMTi6X/WADXhR6SDVBO7w8CrPp1xT95D9vsavM3Og0qSiZRhwUkWmZ+XgiK6/8Fi9c5e0uGCcur00H/8ixT4wbRO7EYxAKxAnXinMldBMMJS7NIGZFDV7dDxfeecvVCPgYjWnWSRB5BQ7nJHR2Rbr/0SaZ1loDp3JiZWok
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(54906003)(7416002)(2906002)(8936002)(38100700002)(66946007)(6666004)(478600001)(31696002)(6916009)(8676002)(4326008)(66574015)(83380400001)(66476007)(6486002)(316002)(86362001)(186003)(36756003)(2616005)(5660300002)(31686004)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzJwcDBaM1M0Y081RUttVU5WeTVkVFRLUTF5M2RkOUlpVURpZzRaN3REM1o1?=
 =?utf-8?B?QVh4VjdWdllHc2hQcWJoakIzR1VtV0hROU5vWFBjQmxDbUU1N2R3bVBqckRm?=
 =?utf-8?B?VWx3TVlTT3FHQUYzTWdIYlRva3dtKytjaysxVlpxZDJsbVVzb3BkZm5JSVVy?=
 =?utf-8?B?UlFyNnRzWkdCSlI2ancrU2EyMklUTkNZSm44V0N3dTc3ODNoWWI2R2JGcEQ0?=
 =?utf-8?B?OVNpVUx1R2t3NU1UYkhMRWtIYkN6UmtaTkpRV0Noc3JHanBoRFlhTTcrUzZI?=
 =?utf-8?B?NG1xUDVjZ2NPR1F3aCs1VUtFV3ZkdE1DNjNQaURjd0dSV1MrYTVHYnFkWGlK?=
 =?utf-8?B?OC9vOHROaStHWmNTelVNU2p1dzdnSTdjK3k2ZG53UkE3TGhZcHBJWEhIZUpk?=
 =?utf-8?B?bGRmanJjRHo4NkhJYkhTcGhtMmxGa2MwbjA3K09tNlVRbkFuTnRPZkFhMFNB?=
 =?utf-8?B?YnZyWnhpYWY5SzVXWkx5ZnZxOXE0UkpWblkwVElQd2plSVZ6RnZJWWgrY09R?=
 =?utf-8?B?bCtWMmY2MXhJUVM2OEg2ckN6TzN3ZVRoUWZzQktONGdlcmE4UjVXbzdrNG1E?=
 =?utf-8?B?b3QyS3VmemlLNzczejdmbEFIZWd5b0FZRzlxU2dmMnBzeUFPckgyTVFpRW82?=
 =?utf-8?B?SFRDWVA3REdiK1Jma0E1MFpwblVnNU1vc2JwYmJvNnlxSTBhZlowYjFGd0px?=
 =?utf-8?B?eXpTdnVTbTFkT3dibjJieWNUKzhxKzNpRUpXQnpieFltZHRNNU5zUk0rQkMw?=
 =?utf-8?B?SS9sMTlYT01BeWVJaVlYUGhFVkpXRU5udmlldHRCOXhESXh2VW45UkE4Sm1T?=
 =?utf-8?B?MUovSm5KRWwwNlgrTVNncjZQM2Vvc0V1MFNyK3JkR1VSVFcxakNtQitjTnhl?=
 =?utf-8?B?NTZvNndUMVYrRnBJdVRNU0FUR3ZadC9TclFmUXowcStueWV5Z2M5eHB0STlZ?=
 =?utf-8?B?K0pZQkIwdEhSalE1WHUyQk5SeTA0Ri9SVFhaTHRYWXBheG5sSEVERHZYRm5h?=
 =?utf-8?B?Qi8vckVDSVB4RVhTTlNNYXRLbXVEMUgxbGZvemhBSmJCQitSTk5pV01weXZx?=
 =?utf-8?B?YXRXc1dKVUJUQ21iQzhYSnF5YlhwdytBWE9BVTQ0a3pBVFJHQlcwV2RSWkk1?=
 =?utf-8?B?Y0E4aFc0QzVWMnlGMzVDeFV3SldqR2F6dkp5K3RTSkdwN0UzYy9CZVFXNVZu?=
 =?utf-8?B?ZHRQZ0FaM3N0ZlA4cUUyanVNU20zRTdKdmpKZW1XVjFYcTJYWnJqWTRNbDdW?=
 =?utf-8?B?U0tTRDN5M1QrYXBESDcyOEhkS3hMRkhJOFVIWjI4M1drT2xDSWk0UENwekFi?=
 =?utf-8?B?M0tkQTIxT3VJZE1aUE1yb3RYZXhqcXhnS2NQcE5FNDBLeXYvWU82WitlK0lh?=
 =?utf-8?B?R2U5QXludlVYL0x6V21EOUFidGpqWXl0ZVBPVHFFZEkvcEtCM0lvdVhBZkhk?=
 =?utf-8?B?TzhWTVR1UE5XVzg3bVN0TEp4TFdUMmlWUzdyOFR4dFhaUm04NnplT1VicjFE?=
 =?utf-8?B?dkg4RzRNYThUT0grdXVDZzNlREVPTjlPY3owV0V3OUloSE53QXY1aHBLOTJl?=
 =?utf-8?B?bnJqRzJ4U0toTkR4VFlhdmFnSG53UHNjcDdDTjFqOVFnU0ZzU2NxT0pwUDA1?=
 =?utf-8?B?RzY1dGNCcHNzeWRXL1dyU2FCeUwrZmhrK242aGN4SDNVbmo2L0xmbnB4dC91?=
 =?utf-8?B?NHA3UlpoQkVKTXVEcllzMDNkOG1BRFIwaWpVdWx2ZCs2bTVuZUlNQ0wrelhJ?=
 =?utf-8?B?K2ZwRS93UzM0MlluY3NsWUFrT1RhNHRlZ1VVUkpUdFBheFlQOGR5cExhZGsx?=
 =?utf-8?B?YjRkb2ZrRUxMU0huV0tKVDRYOVNQNW9CYnp5b1ZEYjl2WG1aS043RHpvL0V4?=
 =?utf-8?Q?LJ2HahX6Jcdg2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37138ed6-02b7-4faf-0240-08d94b885f7f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 14:12:14.2618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqkhwHDUBFU1eMjv2dbYh/F+g86RmJpnQEYVwvc/i7bPdbyFJK2n3qXUGaBQxdDX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4374
Subject: Re: [Nouveau] [PATCH 1/7] vgaarb: remove VGA_DEFAULT_DEVICE
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

QW0gMjAuMDcuMjEgdW0gMTU6NTAgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIEZyaSwgSnVs
IDE2LCAyMDIxIGF0IDA5OjE0OjAyQU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDE2LjA3LjIxIHVtIDA4OjE2IHNjaHJpZWIgQ2hyaXN0b3BoIEhlbGx3aWc6Cj4+PiBUaGUg
ZGVmaW5lIGlzIGVudGlyZWx5IHVudXNlZC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rv
cGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPj4gSSdtIG5vdCBhbiBleHBlcnQgZm9yIHRoaXMgcGFy
dGljdWxhciBjb2RlLCBidXQgYXQgbGVhc3Qgb2YgaGFuZCBldmVyeXRoaW5nCj4+IHlvdSBkbyBo
ZXJlIG1ha2VzIHRvdGFsbHkgc2Vuc2UuCj4+Cj4+IFdob2xlIHNlcmllcyBpcyBBY2tlZC1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENhcmUgdG8gYWxz
byBwdXNoIHRoaXMgaW50byBkcm0tbWlzYy1uZXh0IHNpbmNlIHlvdSBsb29rZWQgYWxyZWFkeT8K
ClN1cmUsIGJ1dCBDaHJpc3RvcGggZG9lc24ndCBoYXMgcHVzaCBhY2Nlc3MgaGltc2VsZj8KCkNo
cmlzdGlhbi4KCj4gLURhbmllbAo+Cj4+IFJlZ2FyZHMsCj4+IENocmlzdGlhbi4KPj4KPj4+IC0t
LQo+Pj4gICAgaW5jbHVkZS9saW51eC92Z2FhcmIuaCB8IDYgLS0tLS0tCj4+PiAgICAxIGZpbGUg
Y2hhbmdlZCwgNiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC92Z2FhcmIuaCBiL2luY2x1ZGUvbGludXgvdmdhYXJiLmgKPj4+IGluZGV4IGRjNmRkY2U5MjA2
Ni4uMjZlYzhhMDU3ZDJhIDEwMDY0NAo+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC92Z2FhcmIuaAo+
Pj4gKysrIGIvaW5jbHVkZS9saW51eC92Z2FhcmIuaAo+Pj4gQEAgLTQyLDEyICs0Miw2IEBACj4+
PiAgICAjZGVmaW5lIFZHQV9SU1JDX05PUk1BTF9JTyAgICAgMHgwNAo+Pj4gICAgI2RlZmluZSBW
R0FfUlNSQ19OT1JNQUxfTUVNICAgIDB4MDgKPj4+IC0vKiBQYXNzaW5nIHRoYXQgaW5zdGVhZCBv
ZiBhIHBjaV9kZXYgdG8gdXNlIHRoZSBzeXN0ZW0gImRlZmF1bHQiCj4+PiAtICogZGV2aWNlLCB0
aGF0IGlzIHRoZSBvbmUgdXNlZCBieSB2Z2Fjb24uIEFyY2hzIHdpbGwgcHJvYmFibHkKPj4+IC0g
KiBoYXZlIHRvIHByb3ZpZGUgdGhlaXIgb3duIHZnYV9kZWZhdWx0X2RldmljZSgpOwo+Pj4gLSAq
Lwo+Pj4gLSNkZWZpbmUgVkdBX0RFRkFVTFRfREVWSUNFICAgICAoTlVMTCkKPj4+IC0KPj4+ICAg
IHN0cnVjdCBwY2lfZGV2Owo+Pj4gICAgLyogRm9yIHVzZSBieSBjbGllbnRzICovCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcg
bGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

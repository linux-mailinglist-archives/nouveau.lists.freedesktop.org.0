Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9D43A0F84
	for <lists+nouveau@lfdr.de>; Wed,  9 Jun 2021 11:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CA66E4BB;
	Wed,  9 Jun 2021 09:21:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF3F6E4BB;
 Wed,  9 Jun 2021 09:21:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FiID1J0KzamhYkLvW6+f5CFBt9iMSijmhlVXVee6VBtKNvv64fFoI0ZYKJ0Hmj7a8agllSbs1xMWrttsLBrceOvmEQHui9iXeOfsi/ARKnsrKiPdwwV0zB0zJZiK/d5z/I9CmwrB0xK1hZD5/igzZuUrozDqXlZvmWd6xJX4z5cJYyHj21dihaucf9crII73rtHFYbbGcKEhjC673Lq+tnZUAtKqkhESQFl+E8SKQAZaZv0eDIDYDbQJFcffCE91jdaBK31zKRQZueCLKguz2MoUxJ7VSIEpWMGJYgV/BBpJoJAo0o2f8n9EmTpah/gsKrFo+w75xA0nUfOj0TcTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEs3YBRW1RiP/S7IyJy3Si1nG0qgvckv6I1do9nJzVo=;
 b=XMhMa3n5DWckchMUgEa0o0+sh+9DmkaYDfL6jA0T3ntkJf+2E9R8ZUX/iMfH7VPiWbmRF5l+VLu7ibLvGC/U5tpgl3DEHZjCxZMVtk0xHwOKa6kLdQaY/Oq09CKKiiEaXk0u3+BZlvRJISzZ95yXk0tYzS32R1YywIuILtf3Ng8RFWmw8fi4vDHKPBwjC3a82b4+4bHuGX7yBk3oDompIKuOTThrS2SLnRxile7k8YJud1YeqPYTsUprnImgmtzWkv5SoDDARzARsIOFF+nxzdwJfZHoscgwdYwCHIJqXqBz8Ib9kiSU2peQbGhD7VgmltYsmAqjvRhMFevQnUATdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEs3YBRW1RiP/S7IyJy3Si1nG0qgvckv6I1do9nJzVo=;
 b=4Q40rZB3O7AUJ/jWSqSRqLvoo87NwSX/CttnZtHpdmASEz4iIbeFVQ5brNVeaEZCQ5K9iWds3dynKod9XZ+sHY6w5e3jJ8ch4Emo5M13RJvCMdIU2JOEfK1NdVJNPh8aszaBCIsG3RmYE4HvT8AwSimD9VaPUgfIYMm98sJOvVc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3764.namprd12.prod.outlook.com (2603:10b6:a03:1ac::17)
 by BYAPR12MB2616.namprd12.prod.outlook.com (2603:10b6:a03:66::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Wed, 9 Jun
 2021 09:21:13 +0000
Received: from BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::d05:4bca:ea51:15af]) by BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::d05:4bca:ea51:15af%6]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 09:21:13 +0000
To: Ondrej Zary <linux@zary.sk>
References: <202106052143.52488.linux@zary.sk>
 <202106090857.42133.linux@zary.sk>
 <1c4a7360-57e3-c75a-c729-1432db5b90b9@amd.com>
 <202106090910.51188.linux@zary.sk>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <762c1044-6e3a-48fc-95e4-1730b6ef2a2e@amd.com>
Date: Wed, 9 Jun 2021 11:21:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <202106090910.51188.linux@zary.sk>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3e79:91ff:ea38:2624]
X-ClientProxiedBy: PR3P191CA0014.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::19) To BY5PR12MB3764.namprd12.prod.outlook.com
 (2603:10b6:a03:1ac::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3e79:91ff:ea38:2624]
 (2a02:908:1252:fb60:3e79:91ff:ea38:2624) by
 PR3P191CA0014.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 9 Jun 2021 09:21:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f29e7db-7784-48f7-d435-08d92b27ecdc
X-MS-TrafficTypeDiagnostic: BYAPR12MB2616:
X-Microsoft-Antispam-PRVS: <BYAPR12MB26162653EF8137E41FFD31E583369@BYAPR12MB2616.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PXCZd0hYnTUQ/d6FiKsiCBjnUehJNryGqQUCtKh9VZtGj/h9v6er5qahwnQ64hxgXaiYujiTaN2VGRTbXHwinQLswYvSrlmAHzxK6Z9HO+TNg1gWHGCzg6rYRFp2xowNQweIHc/S5oqXuq5AbV0Jogp8FZIbCkAdj5d745fcbrGbqwL3QUUad/djUKrC6JI42P4FVeoYefaJ8/Zi07Utpu1thporF7kSaXd1wTN50lXUIGyhWFHg53SGn9SrH+JmGpHb1tzS1CpczBdciky5yVOWJU4iAXuy8Ob1RG6K9VzZ15qd2xwKQD9DClAXvpH1Jbn2hsA/qBF0r+Qj+ecg7RUFdRgpgQmr33QNYMWx2iKMyFMbZxFFSopYyslVJ8Me/h51siwrsiRCFI+4Zh+ft1b8ls2I+CJp+hVzbd6UgkjpNxCzHMan/kkpwmjBbJt+u0YkoqTgOLZWLMi11IXgXBNZs2/whgslEZ+8QxOKaAL55dhkfA5rZ6MGhoUeZ5u8QwuTR17PXxFxENADJJttwWnrDw0SCDv0B+hRNfNlAaroFfXe2XzsRYxSeWgzVD5jDMU2VMRephn0LGq9KJSSZ8SJvmSIsOh94UaXqkfU90IcxLCQxVf8dmeLxDNfWcVLdAa5XPF8EdKaUa20vJqmhCFeM+ZPc2q6nwTzyCqTGRF3JO47fvzQTHr/01uhb7YRMHGMYlagwv3KseoSuqDj9pUrBXsMOIWGnV6ut8IhCF/yU9NknE4vRxS6T01AXnmdm/ywUMQJUNU9NT33+6ENBfhzJv+ecr5TG5JJjkbqozaNFRUsmHi9+YvtSVpDxMWz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3764.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(366004)(136003)(346002)(4326008)(6666004)(316002)(38100700002)(16526019)(8676002)(186003)(66476007)(966005)(478600001)(36756003)(5660300002)(86362001)(45080400002)(6916009)(31696002)(83380400001)(66556008)(6486002)(2616005)(31686004)(8936002)(2906002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajR4S2Z0Y0lzdEZ3aHFZU2UzcVZ5VXNtcVpwYXB5SFgzK0s4UHRKLzNDS1Zw?=
 =?utf-8?B?SG82alM4bDJsYlFZdmd0UC9iTGgyVlhGYW14ckVZR3IrU3ByalMzTHN3Z2dD?=
 =?utf-8?B?OENjK1lSNWtuT0JUOWcyUktIV0poN3ErWXhjUlV3U0o4R05OYVZacmhvalJG?=
 =?utf-8?B?QjVxTUFIa3kydjdEY09RSFpoUlNTbXRScjdDVWNNRzFxbXMvUkJCekRtK1k5?=
 =?utf-8?B?d3JXVWlQeTZob1JGLzlQakdNVXFGZ3Y2WUk5Y3ExbVNZaHpnbm81QVdicDFy?=
 =?utf-8?B?bGJsbWhueEl4NzFQdGw3UU53dkRLRHBlU3g4RGMvNzI5cXQyeHdES09YV3Qz?=
 =?utf-8?B?U3c2TlVqWUpLeDIxbzVwV01KTTBwRnVNbVdEVnk2S2RESnZVbVRSRnVoRDRQ?=
 =?utf-8?B?TFpqSGZsQlMyaGJLWUJyZ1JjMjV0RVFtc09ocnJ1QmswWmRvaVdEb0JIcW1K?=
 =?utf-8?B?eW9CczczbnNtanI1RUpKS2pQVHpRMFMvQ04xblQ4SGxZQnIxZlVqWHBFUHl0?=
 =?utf-8?B?ZE5aK0M1WnFGajFab0s2RElMd3ZwOWhDTnhlczJwOTJpVjlSbmxZQmd3M05U?=
 =?utf-8?B?bzNYOTYzZEEwT3MyVy9XcWtLQVh1WXV1d0VOTmFiMW1qUWZBWVpQTWVYNHZm?=
 =?utf-8?B?cGtzM0hNelVtaDh4QUdkMUEzcTBETmE3OHAwenJ4LzdybEZmWWk1bDVWOFhm?=
 =?utf-8?B?YXMrYmMxazlJNlkrdWZBT3pEd2RnSjhPdjJwb2FUZnlRN3pYdXNZbzRzUzdW?=
 =?utf-8?B?TzF2L0EvV2pUTWRhRVlnaVh4SlppYjM1QUhld29GbWpXaDhscFpiL2h5Q1JM?=
 =?utf-8?B?b2pWZXAwZjd3a2xZVTFRVFV2NEh6VURWSXViMjI4RkZlZDZIdmxsdk1pSmMv?=
 =?utf-8?B?OVNlRHZBR0RWODlMWW9RNWlWVXJXNm1XbGc1NlBQYVZ4WVBYWTBkeThuNnFJ?=
 =?utf-8?B?STMvaXZGdGlzZkY5QzdCVm5UYlhadWlKcEJIOXRSYUJNWXc4RTNJQ2FCdmJQ?=
 =?utf-8?B?ajF4blcvUnp6Z1d1dDl4RG0rTEExejZNZHB4VmpiSHpOQ0F4UXVxWUVQMmNE?=
 =?utf-8?B?d09EakpQY1M5SHB4TW5hdWYyZkNIQUZVNWZ3T0ltaXBkakZzRXNTTjRteTdo?=
 =?utf-8?B?ZHVKZ3FFTXU4eERPT1JhR0N2R0N2dm13dGdZSVdENmJGVEZvOUViOEhkbld1?=
 =?utf-8?B?QmJLS2wrdTQzcm51SmJINjJ6U0hJSURPTGt1T3RaVHNOdzJzZVhzemgyYzNp?=
 =?utf-8?B?WktFL1pqMHZSTWlQbXNWUXhRc1VWYWNpb1ZqTklWbnlUZFlxWFBFSlIxN2Iy?=
 =?utf-8?B?NW9JclpCT3NhY2tkMDlSWWpZYXMrdVJSVmRwcXBMUURUeW1WdG5VVnRPQklm?=
 =?utf-8?B?eDZCKzhFK29PQmxtTzU4U0o5Qml3Rk4vSXZ1YXBPdkppeTRNK0twZnpBT2V0?=
 =?utf-8?B?Q1QxVFJvUDNva2VCZElENmFPaWh4Mktxdjd5RGZJT05ZM0VzY041MGppeVFl?=
 =?utf-8?B?Qk9OZXB0MjcxTE1zNWJ0N2tFbERTditUdmIwTklrUjM3TEswYnoxYy85aGI3?=
 =?utf-8?B?VEJJekNmZTJWL2xHbCtpUlZGdngrdnpCTEJBMmJLbFVnMVE3ZzFFTFNtRVlx?=
 =?utf-8?B?K1pBUjd0MHg1NTFiU2NuallWU1FCOE9DT3gzNXhzT2pEVnpQNUw1M1VlR21Z?=
 =?utf-8?B?MGREN3BCall0aEhpUnMvK2tLRGRCTVViY0hWNWwrOU1TcWhqQjIzbDNlT0ow?=
 =?utf-8?B?THJkTzQ5Qm5VVnp2M0JYQkgwbEhKUzIwTG9LUDZHK1N2eXJMb3Rud3lOWGNP?=
 =?utf-8?B?VDZ5Q0ZsTUlBckxVeVBhMm1SSTRwbUwrNUZ2VGtCM0MyVFRZckZKb0ErNjVI?=
 =?utf-8?Q?Rp0139+J25EkQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f29e7db-7784-48f7-d435-08d92b27ecdc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3764.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 09:21:13.0358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cCBMBF5jdk9kfWwNQ9KJppehirH34XOcyE6Ix4Q0EbpvcT0kcI6JXEj1Tng4oeSt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2616
Subject: Re: [Nouveau] nouveau broken on Riva TNT2 in 5.13.0-rc4: NULL
 pointer dereference in nouveau_bo_sync_for_device
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

QW0gMDkuMDYuMjEgdW0gMDk6MTAgc2NocmllYiBPbmRyZWogWmFyeToKPiBPbiBXZWRuZXNkYXkg
MDkgSnVuZSAyMDIxLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBBbSAwOS4wNi4yMSB1bSAw
ODo1NyBzY2hyaWViIE9uZHJlaiBaYXJ5Ogo+Pj4gW1NOSVBdCj4+Pj4gVGhhbmtzIGZvciB0aGUg
aGVhZHMgdXAuIFNvIHRoZSBwcm9ibGVtIHdpdGggbXkgcGF0Y2ggaXMgYWxyZWFkeSBmaXhlZCwK
Pj4+PiBpc24ndCBpdD8KPj4+IFRoZSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4gbm91dmVh
dV9ib193cjE2IGludHJvZHVjZWQgaW4KPj4+IDE0MWIxNWU1OTE3NWFhMTc0Y2ExZjc1OTYxODhi
ZDE1YTdjYTE3YmEgd2FzIGZpeGVkIGJ5Cj4+PiBhZWE2NTZiMGQwNWVjNWI4ZWQ1YmViMmY5NGM0
ZGQ0MmVhODM0ZTlkLgo+Pj4KPj4+IFRoYXQncyB0aGUgYnVnIEkgaGl0IHdoZW4gYmlzZWN0aW5n
IHRoZSBvcmlnaW5hbCBwcm9ibGVtOgo+Pj4gTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGluIG5v
dXZlYXVfYm9fc3luY19mb3JfZGV2aWNlCj4+PiBJdCdzIGNhdXNlZCBieToKPj4+ICMgZmlyc3Qg
YmFkIGNvbW1pdDogW2UzNGI4ZmVlYWE0YjY1NzI1YjI1ZjQ5YzliMDhhMGY4NzA3ZThlODZdIGRy
bS90dG06IG1lcmdlIHR0bV9kbWFfdHQgYmFjayBpbnRvIHR0bV90dAo+PiBHb29kIHRoYXQgSSd2
ZSBhc2tlZCA6KQo+Pgo+PiBPayB0aGF0J3MgYSBiaXQgc3RyYW5nZS4gZTM0YjhmZWVhYTRiNjU3
MjViMjVmNDljOWIwOGEwZjg3MDdlOGU4NiB3YXMKPj4gY3JlYXRlZCBtb3N0bHkgYXV0b21hdGVk
Lgo+Pgo+PiBEbyB5b3UgaGF2ZSB0aGUgb3JpZ2luYWwgYmFja3RyYWNlIG9mIHRoYXQgTlVMTCBw
b2ludGVyIGRlcmVmIG9uY2UgbW9yZT8KPiBUaGUgb3JpZ2luYWwgYmFja3RyYWNlIGlzIGhlcmU6
IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRw
cyUzQSUyRiUyRmxrbWwub3JnJTJGbGttbCUyRjIwMjElMkY2JTJGNSUyRjM1MCZhbXA7ZGF0YT0w
NCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0NlOTA1YjZiZDJhYTg0MmFjZTE1
NTA4ZDkyYjE1Yjk2ZCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAl
N0M2Mzc1ODgxOTUwMDA3Mjk0NjAlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3
TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdD
MzAwMCZhbXA7c2RhdGE9ekZxaGVCYkpjT0h0WWdxRyUyRnM2M0FUMWR3dWs0UkVtVURKV0h2emFM
QWxjJTNEJmFtcDtyZXNlcnZlZD0wCgpBbmQgdGhlIHByb2JsZW0gaXMgdGhhdCB0dG1fZG1hLT5k
bWFfYWRkcmVzcyBpcyBOVUxMLCByaWdodD8gTWhtLCBJIApkb24ndCBzZWUgaG93IHRoYXQgY2Fu
IGhhcHBlbiBzaW5jZSBub3V2ZWF1IGlzIHVzaW5nIHR0bV9zZ190dF9pbml0KCkuCgpBcGFydCBm
cm9tIHRoYXQgd2hhdCBub3V2ZWF1IGRvZXMgaGVyZSBpcyByYXRoZXIgcXVlc3Rpb25hYmxlIHNp
bmNlIHlvdSAKbmVlZCBhIGNvaGVyZW50IGFyY2hpdGVjdHVyZSBmb3IgbW9zdCB0aGluZ3MgYW55
d2F5LCBidXQgdGhhdCdzIG5vdCB3aGF0IAp3ZSBhcmUgdHJ5aW5nIHRvIGZpeCBoZXJlLgoKQ2Fu
IHlvdSB0cnkgdG8gbmFycm93IGRvd24gaWYgdHRtX3NnX3R0X2luaXQgaXMgY2FsbGVkIGJlZm9y
ZSBjYWxsaW5nIAp0aGlzIGZ1bmN0aW9uIGZvciB0aGUgdHQgb2JqZWN0IGluIHF1ZXN0aW9uPwoK
VGhhbmtzLApDaHJpc3RpYW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVh
dQo=

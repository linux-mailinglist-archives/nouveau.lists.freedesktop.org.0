Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6633A630E
	for <lists+nouveau@lfdr.de>; Mon, 14 Jun 2021 13:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50BC989DFB;
	Mon, 14 Jun 2021 11:07:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B6289DFB;
 Mon, 14 Jun 2021 11:07:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYhIGJIQJsDgGqCqYSC6yNO07JpqF5nGoOn/wE6TiUB+zz9L3MEcOCAkLjpwKuoZHCXscM6Ec81msoaRDsg+JrOoagskv3XhyYIC+SjQsQVS1cy0IPYAyvwUZ4yQbKSvj6kO2k/irbAzCbQQWdkvZ4y9ReeKNjVszhnYqpbK0sPlkEf2+sgbFfxA8m79hZmad0K/yeoLHVV2A551HivA/f7ObPAdz32uc988IVez/8O/LueIPGCfYn9zMcHXtu+kizM40KMGqrPBPUnmL3SKbs5Yxy6J7hREzj76hqwWnJ73p6ZHil4LYHVrz+Cx+1LDctJCKP/IaPcFRi7AlcinDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arNNjHokjt9B8wtc1+DQra3S1hc9rA7VbdNBObU537E=;
 b=kVvHuWxmbxl4P4KdNmgfT9yj2edaN4qWML9BW1/osfmEu+4AvdCeYH5AGicSQsQ/oZbnSzCuKq4APgNWIUvHvLXr6LPDRBvUIvNKCA+jH0ESH7E3XnKtFHW533JA0xrafCwuY0dZnPi9urGtRzrU5pHlE8dJWH36ww0YjiOs93F9WLS5OYy/a6zaHbSUpzGVF10az2L4AThLrw3SWISBzlhU+qaK0R40iC9Uhmuh5YWzsnSqpQLE7sDtq6CIGw6KGyR+Dw5iTkAKOswwbbG/ftE6lYwzW2FRfyq9+6C9hLBtgd6s7Z6fSMjG69SHuZZoZiZNzqn19igzmQjrDDZcYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arNNjHokjt9B8wtc1+DQra3S1hc9rA7VbdNBObU537E=;
 b=OzVt/q6jOEtFZiy1tyAl82ZQ7qZChp4G77AoOV24ljQVYkmuQBaUnA3YNe6VLIIgKJSgXnnEFA2NcEhv+dU4MQV+Nop9YMikQlOuOJu8C/PK3GaZkErM2RRtrhhiayJtA69bqOLcQnJUBF/jgZY/yP5kQJClWiZ6aGhkrnMnL0w=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3950.namprd12.prod.outlook.com (2603:10b6:208:16d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Mon, 14 Jun
 2021 11:07:24 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 11:07:23 +0000
To: Ondrej Zary <linux@zary.sk>
References: <202106052143.52488.linux@zary.sk>
 <d4e5042c-3981-02b0-4b9e-fa2c8e373be4@amd.com>
 <4b4248d8-b708-3832-7fe3-2a9fd2c2311e@amd.com>
 <202106112023.11270.linux@zary.sk>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f5b5ecc6-c0d5-5dac-314a-00799980068d@amd.com>
Date: Mon, 14 Jun 2021 13:07:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <202106112023.11270.linux@zary.sk>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:e8cf:b51d:4c59:9c81]
X-ClientProxiedBy: AM4PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:205::26)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e8cf:b51d:4c59:9c81]
 (2a02:908:1252:fb60:e8cf:b51d:4c59:9c81) by
 AM4PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:205::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Mon, 14 Jun 2021 11:07:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a1e0373-1e40-4df3-2b86-08d92f249627
X-MS-TrafficTypeDiagnostic: MN2PR12MB3950:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3950B52EF328C6E5924DA8A483319@MN2PR12MB3950.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QP3w90tGuUMphL22XoSMbTZUoShOFyIjdA11jMXV8MIUFPXdanjTKY736kIm3xQvyRJap8ZDX/6IS0rhcEKuScMSd6k/FqLS5Lgmmki9Ihv1FMlGw7fFJ5MjlLIYkP5PhIZZDaKc4B1SEry7iZ3rdmzLfHkhxTfiQetXSd7Ld8pYXgJexOtGOakv5oi/PooKLUwojMKI7+x2+oNMdu0V76p9+9oNsWbD+EhvnPZasvlmXHRWSmO3ZIIF7ZVY2q7Fq4twuAbSzuDs36dbZBJp8ZFTRVYhw5KCk8E1UsRp+Cbk4jsaLGK05xwz53K1y6YT3wQ1bUxYL4O6TZuidy6su6d6tpoRn9ABRxBOnbrGZCfnXZO/kRihjzxAhW/MjrpxhOuRLbPDY+IQKo5vYIiZM02cKhdnTWRMsDu0ewcYfg6zCGc5pN0fP2qOaoowWnFBkc3s/hZJ3XsrRNpe/9TzEIu1mEFukQ6dWiYCGDn25TOkDLZUwF/0zULmZ9Jk3neldFple1Bbarblo4QbNbj7SHlRl5iV0pazevSmwqmPuhVl0cdr5rGN2SkKqvg1Pb/9DWj4DKLVhcuWLwFep8mepDFCNFs9jESDuVjXKrp8RS6shpJbulccSgumEH/FC9fL/9LKLf9qph5/2JagZg9EnXKDvV/b6akf6Kl73ZaWcHwiuH1nMSySmU1skDK/Cftu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(316002)(16526019)(186003)(4326008)(6666004)(38100700002)(8676002)(2616005)(31686004)(2906002)(8936002)(6916009)(83380400001)(478600001)(66946007)(31696002)(5660300002)(86362001)(6486002)(66556008)(66476007)(36756003)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVdCd2xKNnZldkRLZi9waFp3bGNZd1JOM1JrOHlGeFlHa2k1bUUvTVlDYUNp?=
 =?utf-8?B?dTJod0UzL2s1NHR0Q1ZrTjZIcndkQ0J0by9aN0d4SjNteDBjay9JWGxCdjVl?=
 =?utf-8?B?LzdVdjE1Q3h3WXp1dGhxVjRHYndsMUg0bDQyRDZmOEtUQ1o2L2N1TmswUi9v?=
 =?utf-8?B?YjFHcXdNR1RYRjFmSXU4c2NLM0pvWHZLRVRHQUVWTGhBM1dUWVFRSGlTRlo1?=
 =?utf-8?B?YVpKRkNJK016dHZJeUFtUWlzb3d4VitqbzQxbnhtL0VHWGlJcTdPY2Z2MEYv?=
 =?utf-8?B?SlFUVFJFbXlEaXN3dUVKamZKQllhMjlCaTNqd0FYZ1BoUHUzUWxyTzRWUjBN?=
 =?utf-8?B?RDA5ZW1qZ3lzNDN6MjN3NG05WlBza0FvejRMeWp6bEVRZGdNNUFUbWZaejBN?=
 =?utf-8?B?M1lKYXIxSWVrZG5ISXU0cGJ2NVhUOWFTS3FWbE5yazRDZWdwejJST1hNU1Zt?=
 =?utf-8?B?bUVnaWhHZTZwR1B4V2x6SzRCN3YxcjZoSnBGL293QlBsNEU4UGJHMXI0eXVG?=
 =?utf-8?B?ZGttVmVTQlVVY1RwQW55SThOdzF4cGZKcUNRdy8yZEc4Q0lLa3p5NXR1cVVT?=
 =?utf-8?B?SEppWFhSWnVoVU9uNGJJMEtXem1HNzR5SFVPa0E1Q244WisyS2NoWFhqTjR1?=
 =?utf-8?B?V1RJM0liOXMxWnFzaGZYRHB5TlhXdTJPMm9SM0M4a3A0MllUbjVhVXdLeVI4?=
 =?utf-8?B?TldjRlVKbnVqVStlYWdERHFmQmlFamxya0lYdE95OFF5NU10T1MrRVdxeFAv?=
 =?utf-8?B?T0hLd1NkdjJNQ3p0anhQcVViVGp3enRadGVGWnRCSVE2QUJyYjArSm5LVWtS?=
 =?utf-8?B?QmpxbVZmR3JlSThpVHFNWlBRanNBeTcvYzZqUUUvY3hnckV3YW15ais1MEdB?=
 =?utf-8?B?KzQxNWRESTNEUkRFVmR4U0dZZENkZkdWblg2dlVaM1g1OFFueHdIZy9kY1ZU?=
 =?utf-8?B?Y0RnampPdWVEbnNoRDN2RWVRWWc2NzJINHlKSEk4RW5zVklhRkFzN2RndExh?=
 =?utf-8?B?bTBlN1ZMNzhGSzlLYUpGZEEzeG5rSnlpMVdRRmFzL3dMVlI5dTRKYnYwNnlk?=
 =?utf-8?B?d2pDVDZ0N1I1dDFHL2ROSUd6QUM1ZnZ6bjRqSm5ESm9oZUhLZkpSV0ZJZjBr?=
 =?utf-8?B?NEFiKzF5bGI2c09CTlo0WGlKY05YK0RGMC8yUmc3QjlXVkFXVzFNWHhSMFNT?=
 =?utf-8?B?djVnRmR0ZnNsWmdqdWkyQ1puc0M4ajRFMkpERGU3TkxlMnkrWU1EQ3A3WUhU?=
 =?utf-8?B?U0VGVmVybFdhMnoyUVF2Z05PR0xuVlF0aEh3YXdBMWR1eHVvbTR5SHFpVWRM?=
 =?utf-8?B?OUNSZUhhNkFQcE0yR1ExYnRqa2FHZlVHOEtVdmQvTk9WdTBRTFN4VGYvdmxJ?=
 =?utf-8?B?VzQvSmVXTGg5TjFaaWFGTDNCcmN0WDc2dnVWN1lzanFEOVlIN29YcmVXdktL?=
 =?utf-8?B?allUVlZNTEdFODhUdVlvbHJoM29TN1F5THBwL0JsYjVkMVp3eW82RFc5Z05q?=
 =?utf-8?B?cDhqTnY5eU9Ibm1jSGdhTVhva25pbjZ6UVpnbGRnYmpDdGF4UlpERzFkZTl3?=
 =?utf-8?B?QllaVFIzV3p6RyswL1Q1UXpUOG5oVWhRaW9PQXdYTjVqS0R3czlDajBVOERs?=
 =?utf-8?B?U1ZlUG9XWmdoYTlBTGtFc1F2Ulorb0tVcHBGQm12Rk5BVGJZOEU1Y0pDdGNl?=
 =?utf-8?B?Q3lsZHhlbkdXcy92cUlNanhiR21wMVBhaFRsam9UYmRDQmVibk43V1JBNUta?=
 =?utf-8?B?MmxsaWZ0YlFPcERrL0F1TlNnbkVNTUZBT2p3a3NRcDRtK1Fha2xkS1BvTDEr?=
 =?utf-8?B?NjdYOGtwLzhqV0RYdDltMityeTFtdUY3MlVHaFdpQk9Gd2ljNEdLOGZiR0VO?=
 =?utf-8?Q?RskwbNwfjI5gx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1e0373-1e40-4df3-2b86-08d92f249627
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 11:07:23.6592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 016to/55FhadIajV53wQSFhCEPFPRrlhpn4+HfbtyBAAxO1A1o8dYO4vIzQiSoW4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3950
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

CgpBbSAxMS4wNi4yMSB1bSAyMDoyMyBzY2hyaWViIE9uZHJlaiBaYXJ5Ogo+IE9uIEZyaWRheSAx
MSBKdW5lIDIwMjEgMTQ6Mzg6MTggQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMTAuMDYu
MjEgdW0gMTk6NTkgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+Pj4gQW0gMTAuMDYuMjEgdW0g
MTk6NTAgc2NocmllYiBPbmRyZWogWmFyeToKPj4+PiBbU05JUF0KPj4+Pj4gSSBjYW4ndCBzZWUg
aG93IHRoaXMgaXMgY2FsbGVkIGZyb20gdGhlIG5vdXZlYXUgY29kZSwgb25seQo+Pj4+PiBwb3Nz
aWJpbGl0eSBJCj4+Pj4+IHNlZSBpcyB0aGF0IGl0IGlzIG1heWJlIGNhbGxlZCB0aHJvdWdoIHRo
ZSBBR1AgY29kZSBzb21laG93Lgo+Pj4+IFllcywgeW91J3JlIHJpZ2h0Ogo+Pj4+IFvCoMKgIDEz
LjE5MjY2M10gQ2FsbCBUcmFjZToKPj4+PiBbwqDCoCAxMy4xOTI2NzhdwqAgZHVtcF9zdGFjaysw
eDU0LzB4NjgKPj4+PiBbwqDCoCAxMy4xOTI2OTBdwqAgdHRtX3R0X2luaXQrMHgxMS8weDhhIFt0
dG1dCj4+Pj4gW8KgwqAgMTMuMTkyNjk5XcKgIHR0bV9hZ3BfdHRfY3JlYXRlKzB4MzkvMHg1MSBb
dHRtXQo+Pj4+IFvCoMKgIDEzLjE5Mjg0MF3CoCBub3V2ZWF1X3R0bV90dF9jcmVhdGUrMHgxNy8w
eDIyIFtub3V2ZWF1XQo+Pj4+IFvCoMKgIDEzLjE5Mjg1Nl3CoCB0dG1fdHRfY3JlYXRlKzB4Nzgv
MHg4YyBbdHRtXQo+Pj4+IFvCoMKgIDEzLjE5Mjg2NF3CoCB0dG1fYm9faGFuZGxlX21vdmVfbWVt
KzB4N2QvMHhjYSBbdHRtXQo+Pj4+IFvCoMKgIDEzLjE5Mjg3M13CoCB0dG1fYm9fdmFsaWRhdGUr
MHg5Mi8weGM4IFt0dG1dCj4+Pj4gW8KgwqAgMTMuMTkyODgzXcKgIHR0bV9ib19pbml0X3Jlc2Vy
dmVkKzB4MjE2LzB4MjQzIFt0dG1dCj4+Pj4gW8KgwqAgMTMuMTkyODkyXcKgIHR0bV9ib19pbml0
KzB4NDUvMHg2NSBbdHRtXQo+Pj4+IFvCoMKgIDEzLjE5MzAxOF3CoCA/IG5vdXZlYXVfYm9fZGVs
X2lvX3Jlc2VydmVfbHJ1KzB4NDgvMHg0OCBbbm91dmVhdV0KPj4+PiBbwqDCoCAxMy4xOTMxNTBd
wqAgbm91dmVhdV9ib19pbml0KzB4OGMvMHg5NCBbbm91dmVhdV0KPj4+PiBbwqDCoCAxMy4xOTMy
NzNdwqAgPyBub3V2ZWF1X2JvX2RlbF9pb19yZXNlcnZlX2xydSsweDQ4LzB4NDggW25vdXZlYXVd
Cj4+Pj4gW8KgwqAgMTMuMTkzNDA3XcKgIG5vdXZlYXVfYm9fbmV3KzB4NDQvMHg1NyBbbm91dmVh
dV0KPj4+PiBbwqDCoCAxMy4xOTM1MzddwqAgbm91dmVhdV9jaGFubmVsX3ByZXArMHhhMy8weDI2
OSBbbm91dmVhdV0KPj4+PiBbwqDCoCAxMy4xOTM2NjVdwqAgbm91dmVhdV9jaGFubmVsX25ldysw
eDNjLzB4NWY3IFtub3V2ZWF1XQo+Pj4+IFvCoMKgIDEzLjE5MzY3OV3CoCA/IHNsYWJfZnJlZV9m
cmVlbGlzdF9ob29rKzB4M2IvMHhhNwo+Pj4+IFvCoMKgIDEzLjE5MzY4Nl3CoCA/IGtmcmVlKzB4
OWUvMHgxMWEKPj4+PiBbwqDCoCAxMy4xOTM3ODFdwqAgPyBudmlmX29iamVjdF9zY2xhc3NfcHV0
KzB4ZC8weDE2IFtub3V2ZWF1XQo+Pj4+IFvCoMKgIDEzLjE5MzkwOF3CoCBub3V2ZWF1X2RybV9k
ZXZpY2VfaW5pdCsweDJlMi8weDY0NiBbbm91dmVhdV0KPj4+PiBbwqDCoCAxMy4xOTM5MjRdwqAg
PyBwY2lfZW5hYmxlX2RldmljZV9mbGFncysweDFlLzB4YWMKPj4+PiBbwqDCoCAxMy4xOTQwNTJd
wqAgbm91dmVhdV9kcm1fcHJvYmUrMHhlYi8weDE4OCBbbm91dmVhdV0KPj4+PiBbwqDCoCAxMy4x
OTQxODJdwqAgPyBub3V2ZWF1X2RybV9kZXZpY2VfaW5pdCsweDY0Ni8weDY0NiBbbm91dmVhdV0K
Pj4+PiBbwqDCoCAxMy4xOTQxOTVdwqAgcGNpX2RldmljZV9wcm9iZSsweDg5LzB4ZTkKPj4+PiBb
wqDCoCAxMy4xOTQyMDVdwqAgcmVhbGx5X3Byb2JlKzB4MTI3LzB4MmE3Cj4+Pj4gW8KgwqAgMTMu
MTk0MjEyXcKgIGRyaXZlcl9wcm9iZV9kZXZpY2UrMHg1Yi8weDg3Cj4+Pj4gW8KgwqAgMTMuMTk0
MjE5XcKgIGRldmljZV9kcml2ZXJfYXR0YWNoKzB4MmUvMHg0MQo+Pj4+IFvCoMKgIDEzLjE5NDIy
Nl3CoCBfX2RyaXZlcl9hdHRhY2grMHg3Yy8weDgzCj4+Pj4gW8KgwqAgMTMuMTk0MjMyXcKgIGJ1
c19mb3JfZWFjaF9kZXYrMHg0Yy8weDY2Cj4+Pj4gW8KgwqAgMTMuMTk0MjM4XcKgIGRyaXZlcl9h
dHRhY2grMHgxNC8weDE2Cj4+Pj4gW8KgwqAgMTMuMTk0MjQ0XcKgID8gZGV2aWNlX2RyaXZlcl9h
dHRhY2grMHg0MS8weDQxCj4+Pj4gW8KgwqAgMTMuMTk0MjUxXcKgIGJ1c19hZGRfZHJpdmVyKzB4
YzUvMHgxNmMKPj4+PiBbwqDCoCAxMy4xOTQyNThdwqAgZHJpdmVyX3JlZ2lzdGVyKzB4ODcvMHhi
OQo+Pj4+IFvCoMKgIDEzLjE5NDI2NV3CoCBfX3BjaV9yZWdpc3Rlcl9kcml2ZXIrMHgzOC8weDNi
Cj4+Pj4gW8KgwqAgMTMuMTk0MjcxXcKgID8gMHhmMGMwZDAwMAo+Pj4+IFvCoMKgIDEzLjE5NDM2
Ml3CoCBub3V2ZWF1X2RybV9pbml0KzB4MTRjLzB4MTAwMCBbbm91dmVhdV0KPj4+Pgo+Pj4+IEhv
dyBpcyB0dG1fZG1hX3R0LT5kbWFfYWRkcmVzcyBhbGxvY2F0ZWQ/Cj4+PiBNaG0sIEkgbmVlZCB0
byBkb3VibGUgY2hlY2sgaG93IEFHUCBpcyBzdXBwb3NlZCB0byB3b3JrLgo+Pj4KPj4+IFNpbmNl
IGJhcmVseSBhbnlib2R5IGlzIHVzaW5nIGl0IHRoZXNlIGRheXMgaXQgaXMgc29tZXRoaW5nIHdo
aWNoCj4+PiBicmVha3MgZnJvbSB0aW1lIHRvIHRpbWUuCj4+IEkgaGF2ZSBubyBpZGVhIGhvdyB0
aGF0IGV2ZXIgd29ya2VkIGluIHRoZSBmaXJzdCBwbGFjZSBzaW5jZSBBR1AgaXNuJ3QKPj4gc3Vw
cG9zZWQgdG8gc3luYyBiZXR3ZWVuIENQVS9HUFUuIEV2ZXJ5dGhpbmcgaXMgY29oZXJlbnQgZm9y
IHRoYXQgY2FzZS4KPj4KPj4gQW55d2F5IGhlcmUgaXMgYSBwYXRjaCB3aGljaCBhZGRzIGEgY2hl
Y2sgdG8gdGhvc2UgZnVuY3Rpb25zIGlmIHRoZQo+PiBkbWFfYWRkcmVzcyBhcnJheSBpcyBhbGxv
Y2F0ZWQgaW4gdGhlIGZpcnN0IHBsYWNlLiBQbGVhc2UgdGVzdCBpdC4KPiBUaGFua3MsIHRoZSBw
YXRjaCBmaXhlcyB0aGUgcHJvYmxlbSBhbmQgbm91dmVhdSBub3cgd29ya3MhCj4gU2hvdWxkIGJl
IGFwcGxpZWQgdG8gNS4xMi1zdGFibGUgdG9vICg1LjExIGlzIGFmZmVjdGVkIHRvbyBidXQgRU9M
KS4KCkkgd2lsbCBqdXN0IGFkZCBhIENDIHN0YWJsZSB0YWcgYmVmb3JlIHB1c2hpbmcuCgo+Cj4g
SXQncyB3ZWlyZCB0aGF0IGl0IHdvcmtlZCBiZWZvcmUuCj4gTG9va3MgbGlrZSBkbWFfYWRkcmVz
cyB3YXMgdXNlZCB1bmluaXRpYWxpemVkIC0gaXQgY29udGFpbmVkIHNvbWUgcmFuZG9tCj4gY3Jh
cDoKPiBbICAgMTIuMjkzMzA0XSBub3V2ZWF1X2JvX3N5bmNfZm9yX2RldmljZTogdHRtX2RtYS0+
ZG1hX2FkZHJlc3M9M2UwNTU5NzEgdHRtX2RtYS0+dHRtLm51bV9wYWdlcz0xOAo+IFsgICAxMi4y
OTMzMjFdIHR0bV9kbWEtPmRtYV9hZGRyZXNzWzBdPTB4MAo+IFsgICAxMi4yOTMzNDFdIHR0bV9k
bWEtPmRtYV9hZGRyZXNzWzFdPTB4MAo+IFsgICAxMi4yOTMzNjBdIHR0bV9kbWEtPmRtYV9hZGRy
ZXNzWzJdPTB4ZWU3Mjg5ODAKPiBbICAgMTIuMjkzMzc5XSB0dG1fZG1hLT5kbWFfYWRkcmVzc1sz
XT0weGVkMWNiMTIwCj4gWyAgIDEyLjI5MzM5N10gdHRtX2RtYS0+ZG1hX2FkZHJlc3NbNF09MHgx
Mgo+IFsgICAxMi4yOTM0MTZdIHR0bV9kbWEtPmRtYV9hZGRyZXNzWzVdPTB4MAo+IFsgICAxMi4y
OTM0MzRdIHR0bV9kbWEtPmRtYV9hZGRyZXNzWzZdPTB4MQo+IFsgICAxMi4yOTM0NTNdIHR0bV9k
bWEtPmRtYV9hZGRyZXNzWzddPTB4MAo+IFsgICAxMi4yOTM0NzFdIHR0bV9kbWEtPmRtYV9hZGRy
ZXNzWzhdPTB4MTAwMDAKPiBbICAgMTIuMjkzNDkwXSB0dG1fZG1hLT5kbWFfYWRkcmVzc1s5XT0w
eDAKPiBbICAgMTIuMjkzNTEwXSB0dG1fZG1hLT5kbWFfYWRkcmVzc1sxMF09MHgxMDEKPiBbICAg
MTIuMjkzNTI4XSB0dG1fZG1hLT5kbWFfYWRkcmVzc1sxMV09MHhlZTcyODllYwo+IFsgICAxMi4y
OTM1NDZdIHR0bV9kbWEtPmRtYV9hZGRyZXNzWzEyXT0weGVlNzI4OWVjCj4gWyAgIDEyLjI5MzU2
NF0gdHRtX2RtYS0+ZG1hX2FkZHJlc3NbMTNdPTB4MAo+IFsgICAxMi4yOTM1ODFdIHR0bV9kbWEt
PmRtYV9hZGRyZXNzWzE0XT0weDAKPiBbICAgMTIuMjkzNTk5XSB0dG1fZG1hLT5kbWFfYWRkcmVz
c1sxNV09MHgwCj4gWyAgIDEyLjI5MzYxNl0gdHRtX2RtYS0+ZG1hX2FkZHJlc3NbMTZdPTB4MAo+
IFsgICAxMi4yOTM2MzRdIHR0bV9kbWEtPmRtYV9hZGRyZXNzWzE3XT0weDAKPiBCdXQgaXQgZGlk
IG5vdCBtYXR0ZXIgYXMgZG1hX3N5bmNfc2luZ2xlX2Zvcl9kZXZpY2UgaXMgYSBuby1vcCBoZXJl
Lgo+IFdoZW4gZG1hX2FkZHJlc3MgaXMgcHJvcGVybHkgaW5pdGlhbGl6ZWQgdG8gTlVMTCwgaXQg
Y3Jhc2hlcy4uLgoKT2sgdGhhdCBleHBsYWlucyB0aGluZ3MsIGJ1dCBlc3NlbnRpYWxseSBtZWFu
cyB0aGF0IHRoaXMgb25seSB3b3JrZWQgYnkgCmNvaW5jaWRlbnQuCgpKdXN0IHNlbmQgb3V0IHRo
ZSBwYXRjaCB0byBCZW4sIHRoZSBsaXN0IGFuZCB5b3Ugb25jZSBtb3JlLiBQbGVhc2UgcmVwbHkg
CndpdGggYSByYiwgYWstYnkgYW5kL29yIHRlc3RlZC1ieSBzbyB0aGF0IEkgY2FuIHB1c2ggaXQg
QVNBUC4KClRoYW5rcywKQ2hyaXN0aWFuLgoKPgo+PiBUaGFua3MsCj4+IENocmlzdGlhbi4KPj4K
Pj4+IFRoYW5rcyBmb3IgdGhlIGJhY2t0cmFjZSwKPj4+IENocmlzdGlhbi4KPj4+Cj4+Pj4gIMKg
IEkgY2Fubm90IGZpbmQgYW55IGFzc2lnbm1lbnQKPj4+PiBleGVjdXRlZCAoaW4gdGhlIHdvcmtp
bmcgY29kZSk6Cj4+Pj4KPj4+PiAkIGdpdCBncmVwIGRtYV9hZGRyZXNzXCA9IGRyaXZlcnMvZ3B1
Lwo+Pj4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYzoK
Pj4+PiBzZy0+c2dsLT5kbWFfYWRkcmVzcyA9IGFkZHI7Cj4+Pj4gZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3R0bS5jOiBkbWFfYWRkcmVzcyA9Cj4+Pj4gJmRtYS0+ZG1hX2FkZHJl
c3Nbb2Zmc2V0ID4+IFBBR0VfU0hJRlRdOwo+Pj4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90dG0uYzogZG1hX2FkZHJlc3MgPQo+Pj4+IChtbV9ub2RlLT5zdGFydCA8PCBQQUdF
X1NISUZUKSArIG9mZnNldDsKPj4+PiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVy
LmM6wqDCoCBzZy0+ZG1hX2FkZHJlc3MgPSBhZGRyOwo+Pj4+IGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2k5MTVfZ3B1X2Vycm9yLmM6wqAgc2ctPmRtYV9hZGRyZXNzID0gaXQ7Cj4+Pj4gZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fdHQuYzrCoMKgIHR0bS0+ZG1hX2FkZHJlc3MgPSAodm9pZCAqKQo+Pj4+
ICh0dG0tPnR0bS5wYWdlcyArIHR0bS0+dHRtLm51bV9wYWdlcyk7Cj4+Pj4gZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fdHQuYzrCoMKgIHR0bS0+ZG1hX2FkZHJlc3MgPQo+Pj4+IGt2bWFsbG9jX2Fy
cmF5KHR0bS0+dHRtLm51bV9wYWdlcywKPj4+PiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5j
OsKgwqAgdHRtX2RtYS0+ZG1hX2FkZHJlc3MgPSBOVUxMOwo+Pj4+IGRyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYzogdml0ZXItPmRtYV9hZGRyZXNzID0KPj4+PiAmX192
bXdfcGl0ZXJfcGh5c19hZGRyOwo+Pj4+IGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0
bV9idWZmZXIuYzogdml0ZXItPmRtYV9hZGRyZXNzID0KPj4+PiAmX192bXdfcGl0ZXJfZG1hX2Fk
ZHI7Cj4+Pj4gZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jOiB2aXRl
ci0+ZG1hX2FkZHJlc3MgPQo+Pj4+ICZfX3Ztd19waXRlcl9zZ19hZGRyOwo+Pj4+Cj4+Pj4gVGhl
IDIgY2FzZXMgaW4gdHRtX3R0LmMgYXJlIGluIHR0bV9kbWFfdHRfYWxsb2NfcGFnZV9kaXJlY3Rv
cnkoKSBhbmQKPj4+PiB0dG1fc2dfdHRfYWxsb2NfcGFnZV9kaXJlY3RvcnkoKS4KPj4+PiBDb25m
aXJtZWQgYnkgYWRkaW5nIHByaW50aygpcyB0aGF0IHRoZXkncmUgTk9UIGNhbGxlZC4KPj4+Pgo+
Pj4+Cj4+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=

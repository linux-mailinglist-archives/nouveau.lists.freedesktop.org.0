Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693FE90DB99
	for <lists+nouveau@lfdr.de>; Tue, 18 Jun 2024 20:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0395610E663;
	Tue, 18 Jun 2024 18:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ltU7bkgN";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2064.outbound.protection.outlook.com [40.107.102.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A891310E6A3
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 18:33:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRpQitC3vzgF1GADgbnkRa+YTQ9SUyRcR8dGmL1Sr+EBRYZ8beBJquP4XwunKx3BbX86o5N+zqrI0QehrqQ53pWPSHquC+lleU9N2CmQJSXemy3DrH9ZgzfX2OQ8CBZQNA+L+9G/Yv3WxTQagBdHzcWCawzDJT0FXsiQeYPGHER03+gEjwX5EodpcMnIRyubPJiEhZffpQw0Av26PGsTZQnILVU1PepPb6OGzA8mlu5HY1tWGA1sYX36nMAWALPnxXBbGn+ORqaJXEast/Bjf6Zsr4M7zlioToari3c8FGRdOra/83IPlACK9LpWmaf8lkYOXBwIMKFj/b1LlWyc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uJMuqZUMm8+jFwcXa075nCeGBkNfOprAnly0Z6SjPk=;
 b=DTt2b7JcdQO+vfQ99hrNYbKsNu8uUVz0qcGBY4AZbieRjwvkBwREB42sT0LYc2m4kMyHMjYpZnNteGVfhK4pTLNWM5La3kLU1uBVDUTfPI3J1U3Y4AorbWn42vzL9/2/5rwkOCqdiErhplllsxQaQs91oWdKiLFwX/rcLHHpB1B5bB1NWiMWXLzlF9sS3gJuxqfpE2F0JdoGzRB4M6KULr67jLaAmC4inbA9yXKdpTzPQ3/uvOg8k7eDsfeNRgW0kVbYMxxo2f5bI788NRlK8OeUylqSK7GuUu/1zuycSQ96yN+jMPcvgWXKpaULyrJjUtEWhRRdGEWvZdA97y9slg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uJMuqZUMm8+jFwcXa075nCeGBkNfOprAnly0Z6SjPk=;
 b=ltU7bkgNgk9UNJiEIuOiM6B3EscXHMID2ZAzyrBCV8/wr2LiB3IbPiVsTq9YBatP+nRg40LfzBxwVKHKpoJb8YenhNgNwkjmo8XPKuR0MRSVK/okXnZqFNBoIXc4SIKOZ8NrsGYjya+DqeKkl4ZCkw/3nExqgjHR7axKH+Vs/9X35YAHCLbX+8SZg8JmwW04KKLGgGvDzVwmdnvap21ZvhB/2EBuvdRaTZDPhddyyazJbcZK4NHLMaAgifMXLuzoWv0uis6KU4pe68MSO6mCcMRtTlTohdBrUsJnY1KL8wB7kq+UMtw27ROy+YYc2tghLtezFqQ1AcaPrtQBAU65yw==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by DS0PR12MB8017.namprd12.prod.outlook.com (2603:10b6:8:146::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 18:33:31 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::ac4b:38c3:29cd:519]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::ac4b:38c3:29cd:519%5]) with mapi id 15.20.7698.017; Tue, 18 Jun 2024
 18:33:31 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@redhat.com" <dakr@redhat.com>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben
 Skeggs <bskeggs@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [PATCH 1/2] [v2] drm/nouveau: retain device pointer in
 nvkm_gsp_mem object
Thread-Topic: [PATCH 1/2] [v2] drm/nouveau: retain device pointer in
 nvkm_gsp_mem object
Thread-Index: AQHavSO4+AqwXoikLUat90oq7M0hzbHMQumAgAGe1wA=
Date: Tue, 18 Jun 2024 18:33:31 +0000
Message-ID: <8fcda81d79a7d1b28f824fb0d50ae23796853fe3.camel@nvidia.com>
References: <20240612235253.1624004-1-ttabi@nvidia.com>
 <ZnB2-3UIAq-aTLpG@cassiopeiae>
In-Reply-To: <ZnB2-3UIAq-aTLpG@cassiopeiae>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|DS0PR12MB8017:EE_
x-ms-office365-filtering-correlation-id: 2d5b7f9a-ada9-4efe-868f-08dc8fc5276f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|366013|1800799021|376011|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?Q042Sk1XajdQT1VtTERSdWJqOTAvZ283U1BIUVJMZE1ZVU15ZWQwK2JWa2FI?=
 =?utf-8?B?SWJBd3pHRU5BV1Y3MVFnWWNuRS80Mk1HWXNJd2VjeWlPZVFwU212Nk41ekVI?=
 =?utf-8?B?bUJxcnJOMlFnajUwSzRqcWFHRGtOMGNSU0hNZVRua3JmZkpqNHZZVDVMTjVx?=
 =?utf-8?B?YTc2bE1XUlBJN0h3N0hZMVdWNElVWDZEWG8vQ2loOGczUkpmb3R1SU1rVWxU?=
 =?utf-8?B?SFVvV1RyQmllcERkd1RiZ1lMV0dHRUx3UVQreUxjcWRRYlQ1alZrWDRzQis4?=
 =?utf-8?B?WkExaE9QM1JhdG54UXUvTmwra2F1UXJnSDZFL3RpdVc5ZU5QZktUMGZFRkVP?=
 =?utf-8?B?OStCN2VsRzFjZDlmbE80LzhEcS9WSkZVSlF1cS9OTUVSMjJJMTI5YUExTnFK?=
 =?utf-8?B?OUNKU0VwTHRmeUpFaXVUTjVGcXdWTDRXMlA2MHpCRjQ4RzZua1F2RDY4TnJM?=
 =?utf-8?B?dEVxRVhkdG9ZaXlsWGt3MXlqcHRmTDdRT2Y2eVN2b1RyTkxMQ2NxQUtKMENk?=
 =?utf-8?B?bkpUVTI0cDVuVFFBYnBVc0YvSWI2S0MwQ1B6YytBZ1NFVGg2NlVMcGduUk5u?=
 =?utf-8?B?UmkzcW9JakVkNHNmU2loV1doUDg5UE52T1ArNmtxRkVYbUZhZ2lyd0k2YUR3?=
 =?utf-8?B?TFgySCtYbnorVGVPYkp4WjRia0hYdVQyYnpFcE9YT0tVY2tSaitVMzA4ZXZQ?=
 =?utf-8?B?aHM2OHFtUGtHZjdoK2htcjZxUUVKWHdSV0pabXRLNDJHcUJ6RmJjQjNmVDI3?=
 =?utf-8?B?WktYUUkwbTdvZmZ0VWorWTYxc0g1QlMxazIzMWc4R3VqQmZIZUM5R0YxVEVu?=
 =?utf-8?B?YTZ2NzRHcDk1SlBsSDkrcXd0blRBaUZ3L2pieHJHNmxaakZTeVVxNHJKUW01?=
 =?utf-8?B?YW5OTkZWUm9PbllwYitVemJjRkxERjRaNmFuSGluYTFta0p0aG53MVMySnhq?=
 =?utf-8?B?YVBNdWp6c1VCNm5DTzRzZkJ5blJKYzRSS3E1MVhZYnpuTnJxa0srYzRIR3RL?=
 =?utf-8?B?VkhTZWtzaFhZQTF6Rmh6S0h0M1NsQ25UaCtsZXc1NlhnWCtPeGdqWmVLK1E3?=
 =?utf-8?B?R1JOaHA0cTBhUGVVZFIxdEIwWEtkVU84Z3hlUjFBL3J6cjdHYW1oUCtXNFdy?=
 =?utf-8?B?S0hUK1NUNTBUMExlQmFJWTlYUzNQQllDLzhUMkR2ZW9VT1pMRndCcnZZaTBI?=
 =?utf-8?B?ZDUrTG1PSUwxdFh5UnFCYmtFWEZqRWl4Yy9QOFBtU21lZGYxZW9EK0dzNk42?=
 =?utf-8?B?aStUN0lLUHo4NitHM09sWGdIYitUckVSbGoweGNyQ3VjeFpHSUhNYnRMNHRt?=
 =?utf-8?B?elp6MXRRZ2xGZkZvNjNYVWJoaHhyMGRjNzAxUDV2VEpOS2VtS3dzWFBBTVhz?=
 =?utf-8?B?WnVLYU9vMVJQUlR4SE9TMXVhTUoydjh0aFhEeGI1S29sa1lTSUZwa0FVRmNv?=
 =?utf-8?B?TUlqTkJ5bTB0NDdvTDUrcHRyaWllRVZMR1pZMGRCMStrRWpmMytLdHdzSEZO?=
 =?utf-8?B?OThjTzN4cXVQdTF3NExRTWNwdjNkNGp0U1J1WHQ4clZwWklmV2E1dzZrNmxj?=
 =?utf-8?B?VU9kSzZ5M3pXc3hPTkRYa0hHeTMxYzBOdTJFWCtyVzVDM2xUWVljVTM5YjE2?=
 =?utf-8?B?QjRudCt3cWpEZW5JaEloVXFvSjJ3VW40eGl6YkpPdk14U1Q3bmZ2YWhtRU96?=
 =?utf-8?B?MHBoL1Ixc05YVEVIU1A2cndLSlBHWHJVTGVmdHVEeC9DcDc1ZzNjYjd4REx5?=
 =?utf-8?B?WTVBcXFuOE1qTEdhcHA4TTQ5Q0JudEFLSlVBMld1VDA3RW0zWnRtZExXYi9i?=
 =?utf-8?Q?iXfrwQItAcFHk/0NLla+yhxTdSxBJtBzNGot4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3pVWk1PRXloLzVLeWY5Vi9ETjh0a09nTDg1ejEzdER1c3BzQmhiMll3ejhh?=
 =?utf-8?B?bVU0b1pyYVNhSkhCenBSWVpyalVyWDl1U1JaNEYxdnN2TExJVkNGSTY5Ykx5?=
 =?utf-8?B?a1BxL2FLdys5alNHT1RNWVlyelB3VzFKdGVGU2o4cnlkMzNRdHIyelVoN3p6?=
 =?utf-8?B?RmQ5VG1yb0JFRHNheDZUSVFYeFd0bnNiM0UyUGZqUWJJUXdIa2RMNUtzeExp?=
 =?utf-8?B?d1psenJCc3lkN29nS3JhcHN5VzdCaXpRVXNBL3RZZTNZelphZURVRnBRTzNm?=
 =?utf-8?B?di83VTJuenNRM0w5dWp0S0ppU2F6OHc5S2dnRWVydWo4eWhFaVE4OUtKMjdY?=
 =?utf-8?B?OThMV1U0YmJrOVZHN2gwVHBzalFxd084Wkl5Q1FiUUc3S240dW5NaUd2V0Fw?=
 =?utf-8?B?VTdvUUg3NEdLdjljdHVjcU94VnFNdGFSVEVHZkhJMlhsanQwTWNEcEk1cU9D?=
 =?utf-8?B?eXl2SXVuN0d5U3dVVWExUk5VdHMzTFZ1MTZ2RjRKTklrelVPWVIxY0Q2Q01i?=
 =?utf-8?B?RDh3bGlEZ3h6a1I3NWg4a1BENHg5dFlpMWJhejBBQy9YajQxdVNJT1YyZmgx?=
 =?utf-8?B?cDEvVUdxM1VleldXcGtLOVkvaitVMG9YeU9SMlNqZU51Mi9mRjhUaXYrWkNk?=
 =?utf-8?B?MEZ1NjlMazB2UGRqemdXYk03V2Y5WnBtT3BzRjlaQjg4b0UvNFQvbTUzYUI4?=
 =?utf-8?B?Q0lRYVdMWHoyLzkrRXBlSllqOGJUd3JnVjd2dkdUeEk3dTFuZVlueHNmK2Jw?=
 =?utf-8?B?WDRRM25paFpWZUoyaVhZU0lVamhPRnhPdXhJcUZZeVlSK2ZZQllvWUxoRjhx?=
 =?utf-8?B?TDVRbnk1WmNSNllON016KzRhMUxKeEx5TFVZYzhGd2ExQTNZakZXMEg2eU1q?=
 =?utf-8?B?bEZHdkYxaHJ0cjBHMmNpTVpMVW5EcTJ0ZVFaSlA2RWVGUW1DWTFEbmEwWTNU?=
 =?utf-8?B?Qjh3ajZzVHI1WkMxRXJ6M21WM0xVdFJKNksvYU4rTDYrUUdjQ2ZPcXZQT1d3?=
 =?utf-8?B?ZFRrV2VzMm9oR2orSmFVd1YzZi9EcEY2OXZGRHhyS05PU0F0QThubm56TGx4?=
 =?utf-8?B?dXl1UmVHSUgwZytCNmppQUhCd1ZkamVUZkpNWS9OU3k3TGYzL000MU95emJ2?=
 =?utf-8?B?S01lMkxOMHFXc2FJZGtQNWIwUW5xc3RINjM1ZDhXNU5UOW03YkQ3K2pINWdL?=
 =?utf-8?B?NmJRZDVrcElwUVliZkJHMDZhZ05obTZtVFFwM3o2eWRISk1iKy96MldOVjN1?=
 =?utf-8?B?Q2RyL2Zub3l2V1F4bTkzaWtMeGU5K3crRW5YK2N5MUxBSUx5N2VzV3lPZ0l4?=
 =?utf-8?B?Vmthc2dpMy8zVHRJYXBFN2IwYkRuVkErc3FHZUtoWTlXR3RIdnBRWHlBK2RN?=
 =?utf-8?B?Wmw0U2dtZVpoUjN4WEtBWDhnRFdUUFRXYWZZOTgzb0trRGRoUGlUWktFbjIx?=
 =?utf-8?B?Q2cxOG92TzQxRnBlV3NmTUQ3VjR5aGIzNHpycUR4RzBWZlI3cUFQeVpmNjcr?=
 =?utf-8?B?RitMYm9SaHNRS2xQMGNpbDdldXViMkFtSVVWbVladWdYa1N5MjY2dE0rUGpr?=
 =?utf-8?B?VnY0MnlVVzBxZkJKS1VtWXI4cmhSSmU4YWk3WmVpSWFTM05vRVNLODBEdDA1?=
 =?utf-8?B?KzZiTnlFbGZINTBpdFJVSWRHUjVJYVBka1c1TGRGMjNkYjhpWmFGYThudGhO?=
 =?utf-8?B?UWZxNTM0WC9qS2luaFNYbmovU2M2YVc2K2hvK3kxakdZR240UW02UGxTTGpT?=
 =?utf-8?B?VnNNREZWWW9FTzZjbVNrSHZnTEUyaFZlTFZRM2U3di9zT3JuU2JmOVpvTGdt?=
 =?utf-8?B?dDl6ZGVWbytDcHRwbE12U0VYVTcrUzFJYnRITTF4SWdPc2dsdndTN1U3bEE1?=
 =?utf-8?B?bUdOYlRnTzRESG9aZ3VOL0lZYTcvQW5aMVQ4K1Vmazd1c0RpU1B5eDB0TXBO?=
 =?utf-8?B?UEU4OVpoZU80OSs3SHJDakNkbHRvQW1TYXRLNjdjN0ZvQS96ZzIzbno0ZG1w?=
 =?utf-8?B?Wisxc1ZCUGpQdWxRbkQ2Y1hSUFNrUWRQRGplQzVyRnk1U3UweHMyb0hJNHYx?=
 =?utf-8?B?VEJPL3dESUltdnhnb09BQUVNa0czVG5YT0dMdG16SXFZK0d3eVNJLzhlUFVD?=
 =?utf-8?Q?5NHiijFhXje4QQzdH456KJn99?=
Content-Type: multipart/alternative;
 boundary="_000_8fcda81d79a7d1b28f824fb0d50ae23796853fe3camelnvidiacom_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d5b7f9a-ada9-4efe-868f-08dc8fc5276f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 18:33:31.2144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vt+VRzxbBPZicIojW5Qe6X8zqAHsUV/MN9XvxCuHPYLGPt6arevPitrO5eEx1n09C3NZwIUsORwrjQGF4zqDcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8017
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--_000_8fcda81d79a7d1b28f824fb0d50ae23796853fe3camelnvidiacom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDI0LTA2LTE3IGF0IDE5OjQ4ICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KDQorICAgICAgIG1lbS0+c2l6ZSA9IHNpemU7DQoNCisgICAgICAgbWVtLT5kZXYgPSBnc3At
PnN1YmRldi5kZXZpY2UtPmRldjsNCg0KDQpJZiB0aGlzIGNhbiBwb3RlbnRpYWxseSBvdXQtbGl2
ZSB0aGUgZHJpdmVycyByZW1vdmUoKSBjYWxsYmFjaywgd2UgaGF2ZSB0byB0YWtlDQoNCmEgZGV2
aWNlIHJlZmVyZW5jZSBoZXJlIGFuZCBkcm9wIGl0IGluIG52a21fZ3NwX21lbV9kdG9yKCkuDQoN
Cg0KICAgICAgICBtZW0tPmRldiA9IGdldF9kZXZpY2UoZ3NwLT5zdWJkZXYuZGV2aWNlLT5kZXYp
Ow0KDQpUaGF0J3MgYW4gZXhjZWxsZW50IGlkZWEsIHRoYW5rcy4gIEl0J3Mgbm90IGN1cnJlbnRs
eSBhIHByb2JsZW0sIGJ1dCBsaWtlIHlvdSBzYWlkLCB0aGUgaWRlYSBpcyB0byBhbGxvdyBpdC4N
Cg0K

--_000_8fcda81d79a7d1b28f824fb0d50ae23796853fe3camelnvidiacom_
Content-Type: text/html; charset="utf-8"
Content-ID: <731611E3211C624180CB6A2CB46E2677@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj5PbiBNb24s
IDIwMjQtMDYtMTcgYXQgMTk6NDggKzAyMDAsIERhbmlsbyBLcnVtbXJpY2ggd3JvdGU6PC9kaXY+
DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7IGJvcmRl
ci1sZWZ0OjJweCAjNzI5ZmNmIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPGJsb2NrcXVvdGUg
dHlwZT0iY2l0ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4OyBib3JkZXItbGVmdDoycHggIzcy
OWZjZiBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxwcmU+KwltZW0tJmd0O3NpemUgPSBzaXpl
OzwvcHJlPg0KPHByZT4rCW1lbS0mZ3Q7ZGV2ID0gZ3NwLSZndDtzdWJkZXYuZGV2aWNlLSZndDtk
ZXY7PC9wcmU+DQo8L2Jsb2NrcXVvdGU+DQo8cHJlPjxicj48L3ByZT4NCjxwcmU+SWYgdGhpcyBj
YW4gcG90ZW50aWFsbHkgb3V0LWxpdmUgdGhlIGRyaXZlcnMgcmVtb3ZlKCkgY2FsbGJhY2ssIHdl
IGhhdmUgdG8gdGFrZTwvcHJlPg0KPHByZT5hIGRldmljZSByZWZlcmVuY2UgaGVyZSBhbmQgZHJv
cCBpdCBpbiBudmttX2dzcF9tZW1fZHRvcigpLjwvcHJlPg0KPHByZT48YnI+PC9wcmU+DQo8cHJl
PgltZW0tJmd0O2RldiA9IGdldF9kZXZpY2UoZ3NwLSZndDtzdWJkZXYuZGV2aWNlLSZndDtkZXYp
OzwvcHJlPg0KPC9ibG9ja3F1b3RlPg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+VGhhdCdzIGFu
IGV4Y2VsbGVudCBpZGVhLCB0aGFua3MuICZuYnNwO0l0J3Mgbm90IGN1cnJlbnRseSBhIHByb2Js
ZW0sIGJ1dCBsaWtlIHlvdSBzYWlkLCB0aGUgaWRlYSBpcyB0byBhbGxvdyBpdC48L2Rpdj4NCjxk
aXY+PGJyPg0KPC9kaXY+DQo8ZGl2PjxzcGFuPjwvc3Bhbj48L2Rpdj4NCjwvYm9keT4NCjwvaHRt
bD4NCg==

--_000_8fcda81d79a7d1b28f824fb0d50ae23796853fe3camelnvidiacom_--

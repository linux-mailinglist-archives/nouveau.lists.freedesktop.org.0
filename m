Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BFFBCDC85
	for <lists+nouveau@lfdr.de>; Fri, 10 Oct 2025 17:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275F710E0ED;
	Fri, 10 Oct 2025 15:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CKq4s8t1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012071.outbound.protection.outlook.com [40.107.209.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A7110E0ED;
 Fri, 10 Oct 2025 15:23:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NfeG9JPgVj1n5lDNtgx7vUhEniKiL716IhVD6hXXieV3wsScOomVltI/FlXI08Cz3Ji5u3AB/ouQnLDO9vZzvKUyhYg3Td+3NHUakqopm3yxoGlh08Pg6MJVRIrZmRno0mHbBTIYgoL6DOz2nWRKrWFbaGwX3RRGUxByX/su5GgWFIloPkJtOLdT9LjK16JTflycZpp/v2LE+cJ6lvhZCipptyBAmri9cDCy7FEcETOvOSsnwFTu0MdIyMJpVafkC6iUH5RQhOumZRvQQGQqmg1iXph9rQ8l64TLF0laA/oA290AOyxvp7WrNGSTIyJUmwfP1aGwT2EU4JtIx1CL5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcGjRztxvIKm9/GYX8d68YJFJjYK787k/Z8eWT4g2SY=;
 b=yPJmSyQLzfkWmYKc1bTIDISxOs0dPBjZVD1M9e/r0vR3wEo+ijT/ZVRNKaKdZoZK0T+jm/3Oi1++CkvfQkW4XT046ghB/scBrr3E5Bd1TVGhiveLjpo851pL4WpT21y2+ESU0DcflSkowiX0irJz8IYFlCqAQc+Or0pOn23Bu9Y+Ali+rsicmxBCM9LBlrXHN8yekoa+83xK2TjbLhGVm5UjtPrWs+42eh0akdZaCOlMGROh2kT9Fhu38X6VillF6TACVL1I0QApWz6416/EXg7zjRepTa7OpMAHxMu4ITzpngC4cDwM+St4qEcEFe4VthC/R/DdCjLXkzIGr+Sipg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcGjRztxvIKm9/GYX8d68YJFJjYK787k/Z8eWT4g2SY=;
 b=CKq4s8t1JqniLL0R1CgXYs1ogw5gt2GEe70GHfGiIZ3mfcf7y3+zGs7Slf6TzcL6Fw/A8lXh1fNKBNvecPDkak4l8z6FHrZVInb+ZR4MNeRhp+cemZzUk+ioGVTTp6t+MuvpUbbaoOm2Qrp7WZc+jeScjqEmRl0yGzqUtfnU2XuIdp1/ZPlO4zHkRnY4sOKJW3wbamow/fyg4a/zT43zNMhGB4tW05ja7wUc40aleva1TQ/aSoEk0Ug4VI802Yolz1QCv0XRKQRbSVSpb3InxDl/G2VGX7TFSnA7PxL4BGypM2RdRKlncTkVu+zJt3GO9AIexicsw4JLLj7Zm0N5ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ5PPF665EE4E73.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::996) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Fri, 10 Oct
 2025 15:23:04 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 15:23:04 +0000
Message-ID: <b53e554c-252d-4b21-a337-578c97c80dde@nvidia.com>
Date: Fri, 10 Oct 2025 11:23:02 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/3] rust: kernel: add bounded integer types
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251009-bounded_ints-v2-2-ff3d7fee3ffd@nvidia.com>
 <20251009213353.GA2326866@joelbox2> <DDEIH181JDA9.2DG2C3DBOB2V@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DDEIH181JDA9.2DG2C3DBOB2V@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0651.namprd03.prod.outlook.com
 (2603:10b6:408:13b::26) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ5PPF665EE4E73:EE_
X-MS-Office365-Filtering-Correlation-Id: 28dc7fda-f016-4507-9d32-08de0810e876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWowNnhOMzV1TnhiQVN0ZkQxVDQySFNFMUd6SWdQMmovY05LbnoxL25VcWFx?=
 =?utf-8?B?cFJ4d1E3OXFGMkh3WGRMNkVBR2xEVmI2dlVLdW5KRUJtNGJGWUlXT3RuZEFC?=
 =?utf-8?B?NU4vTXVCb3lhVHFpWTJHa3dxeTNrdE1HS0lSMXJxT1c0YnJZd2Y0MVR6dTZF?=
 =?utf-8?B?c25QV05WMHNFZCtLV2VBeHQ1bmwzUTE1dDliU1prdXFZM0dTbUhVcGcva1Yv?=
 =?utf-8?B?c2xISzk5aDlPWUJGemZrVUF0Zkp6dE5Ob1dyK1BHVVY0eVZVVUNpQ3crQzdZ?=
 =?utf-8?B?WkdSeUZURzZOSkRJKy93YUNRWGVrYW1HNXhIazM3aHFCTDh5cG1VZ2s4a0NX?=
 =?utf-8?B?RXA1c1JwRzlCcitzdXVQL1h0czErWUtRN09ROGx4SEw5bSszdGVJbDRIa0tQ?=
 =?utf-8?B?bk4rMlpvei9DVzFlcDlLRzdBYjUyZU5KSzlNMUZMa1lSWTJzT1hiQzdRRC9R?=
 =?utf-8?B?MWo1eWRvdWZKQzBNZ0lqTDZ4QStoK1psbkZzd1h2a0ZHYkx2TlA2YUZ3Sncx?=
 =?utf-8?B?dlZrSFFnNmhhT3ZSTFprVDdleWlDU0RleWdDcCs0bFBmMWVMbFNMOVl6elZP?=
 =?utf-8?B?RVk5a0kxUUV4R04vVnRpY0t5c2dRS1hibU9SK3AvRGdJcWNuTWE0ZUJIUHAz?=
 =?utf-8?B?aG5BeFVUUC9TMmMvN1haREFFMnlvazlBRCszRUJkWVR3ZVJqNmFKWllSb2VI?=
 =?utf-8?B?ZjJGQWRJWmRiZzFhVnBIU1lwSXlyWFpIQ2FMUEdVVTFPTWdjSUJHMVZhSnlK?=
 =?utf-8?B?K0h2SVo3TGd5cTh0SU90MmVjbHF3WUp4SmI2c1JFUHcyWWhBSklhMXdOdmJa?=
 =?utf-8?B?Um9pL1dhRW9Sejd4U25rVWpaSGZpcXZaUit3ME9TRm9KcmlNZityZitTbmdh?=
 =?utf-8?B?eHo4eVdZY0JDRmszcDFFaGIzMitVS3RYZy83b1FVLzBSUk1kVTV5Q0hua0Mz?=
 =?utf-8?B?dHpXcnp1NlhLR0daNmZQNTJlanpjcEhhRWRkVG1LQy95ODdla2ttMWpiVWNB?=
 =?utf-8?B?SGN4ZnpLaTlHSngrKy9haDJXNGljMVF6aWNxYzh5NWVJeXNPUkVGWS9vU0dE?=
 =?utf-8?B?eFFvc0MvZm5uSUhwdFh3MFVhUGV0VEh4cjc4WmJka0M3alZTQXZLalU4VXBY?=
 =?utf-8?B?QjRDTjJkZ1lzNlQ0dUkrd1YvVXh1WEc0MVRmWEcydjBwT0hhZjFOZ0dkTTlI?=
 =?utf-8?B?dC9wTE1Vc2dVTEFCdURnWnljaHFrcUEzQjNBblNRZlJENzVrMTJuWmpmOGg1?=
 =?utf-8?B?TlQxVWh6TkJwR29LYmlyME9WdHZObWlQbnIrMVN3M1hYbTZ6R2Z6Q1FaWVY3?=
 =?utf-8?B?VzF6RzRtRFJKT3lTNXRIcmtZRE5HYmNtNTFPWXZkM3AxZ1BpTmJSUVBlanF1?=
 =?utf-8?B?UEpyUVBWdjg3L2dVOUJSUU5WTHFVUTFuZ0tOM3M4dmdWKzRadC9WZDV0azVD?=
 =?utf-8?B?REZqZXA5R0g1VFczRWdFUHFKbGxtNGhiSEtGV2tyNFpDTzJHN21Rb0twcGNv?=
 =?utf-8?B?R2NKQkZEVXdDT3BvZTdMZEhTNkZpNlVkOWtHWm84OWVxVS9rYytuSUZ4SVVL?=
 =?utf-8?B?VFdQeFdVR3g0Y2Z5SHZFUDBuNmN5TGRrYW9aRWdYbWVyeVF1NU0yS2d3NHFq?=
 =?utf-8?B?bWg3aEdDYmhrUkdRWTdad2lKeG54L2t3eVZhb0ZBUEtDM241aGJIcTN4OE0w?=
 =?utf-8?B?S1p5SHBlaXNuQVJ2ditjdkhlR29QWWkxTEQ0RXVWd3dPL2QyQXc1YmlkSk1t?=
 =?utf-8?B?cEgyQVRaZnNSMzNDN1hxMUV4bnVnV01iOW1wODRUb29zV2hBZ2J3L0puZjlr?=
 =?utf-8?B?b0prK0kzRDc1cmVqLzA4ODBNRGQzejZIa3pkbkQ5aUV1VUZBZmo5NHRUYWx3?=
 =?utf-8?B?anp1MzROSEJzVVFGbGR3dmt1Y3RKZlVDYzZmamRONW96djJScjVodFpBR0I4?=
 =?utf-8?B?d29WWjlOU3Vtak5DcTRxd3FYQkVzWGdTRU5FMDlCeDNhbDlBS25hYmF1N1dE?=
 =?utf-8?B?RmdZRWthcnF3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHAzZ2gxcUQ0U0k2Z1d4Y3lxVGhDK0haN0dYL2dvZEZXcDFyZmEvWG12UjQv?=
 =?utf-8?B?djRDTUJuSzQyS1kxQmF0emlRZHlYWGlYYm9iVTcvV3JSNE9EM0k2WDVld3p6?=
 =?utf-8?B?VFBOZDFEblJJcVgyYTR3RTh4M2lXUFpPRThTTHRsYXA4aU9icC9xNGdnelVV?=
 =?utf-8?B?OUF4enE5RE5Gd1Y3VkpDL3RuUlpsTmo4aXNHSWJaeDRiTlRGVUkxdFNJSjJF?=
 =?utf-8?B?QWp0aERqQ083K21zWTBjKytPY3Rxd1FvYUh3Ykhwd0ZyN3k2cnprVWlnUFBN?=
 =?utf-8?B?MkVIc3hmR0ZnVkZ0eDBvSW8rTmtlS1F3ZldVWkZnUHUxWkdoMnVjRFdLTGRI?=
 =?utf-8?B?bEc4Wlp4bVlOL0N4bjMxcytybC9idFZQdC9kc0t6cy9pL3ZjMGZJb1Fxd1BG?=
 =?utf-8?B?cFBPbHZnb2V4N2YxTkpzR0U4cm8rNmNNNnpFWGFZSDR6eUJjcjNnSmV0N3RT?=
 =?utf-8?B?b0tRcGRhWGR0aWxrR1Q3V00zZkptYmFaUnBKVXFtTHJsTzdpVStjczRPenV1?=
 =?utf-8?B?WittY3dlc0pJZy9jeEowYlpZR3JlMmxKSWpRWUxrMGx4dkpMVFdlQlEvdDJ3?=
 =?utf-8?B?NHVNalBQOGVZZVhKVERxdm15dU5YTXMwR3QyWGd3QmxCYk83NHBMd1JBWXZn?=
 =?utf-8?B?QXJJZytNSUUwSTBQdmIwTVFTMGV1V3FMSXBLWTZGQ3dRUXFDMnU2TXRVb0pJ?=
 =?utf-8?B?Nm5QK1oxazdNMlphVTBIakJRYUxMaW5ndFdHTkdWWlBNdWRJc3Y3KzFRZU04?=
 =?utf-8?B?TDFHT0wwTHg0T3R1UDFuUXhWR2VydWZTS2VWZm5jQUwrTXpnM1JrRm82Q0Vw?=
 =?utf-8?B?Slp2MGZabHhBVDBOdisxaVhxMCtxN21Tb1RITjhVcVR5RGkwMWl3bUpkZkFi?=
 =?utf-8?B?dENVZVo2QW04UFJJam5Ja0JjNGJESnJ3NElMQ0pSa1dtOVhySkRxeTkyTkVx?=
 =?utf-8?B?TzkvUjZHOFpXbTNLVlB2eWQ1SGkvcVZvbktTNy9PZ2ZqRDJ2MW9odERZK3BI?=
 =?utf-8?B?cVZJK1dYYVFkZkM5SkZrYzBxQ28raklNQVByRHMvWTlzdVQzUjk4bCtQTis5?=
 =?utf-8?B?a0dTaERDMWkwd09tQWVPb1B4amNjUFZrTDBmVWhSVytPMkhsRVRJSWp5ck9M?=
 =?utf-8?B?UCtjMmtHK1RSLzdHUzBNZGZPV0o4dFlFSllWaXFFN0tCQWRDSU56djhQaTVE?=
 =?utf-8?B?NUl1NHhnekFwNDd0VXpYRjFLck4wUTY0Q3p1V0pzOEh3TnRDc0ZwMDlhU0di?=
 =?utf-8?B?c00rM1pvUEkySXNoTmdiUWdzcTRaQ2loSHA1VUc2bHFtVVZkK3V2d1lJNzY4?=
 =?utf-8?B?NURHN1JPV1hXajBTemlNVlZaaEhIcUc1Wk84emlySk00ZnBnaFVEV1Mya25W?=
 =?utf-8?B?bno5ZkV3VGFIZjdKalhTUVJ4S1ZObEhYZ3dYbVBiMHl2UjE1K0owbm8wNkFU?=
 =?utf-8?B?VkVGSmNKcVhOZldrK1NHNWdFN3pFNjF2eENPTVlTdDRTODRsWmROSFFCZVJ4?=
 =?utf-8?B?bU0rUDVOZnp1NDA4bjRJRHVFWjk1amJpYVR6TEVYbFNaVXJxWlQ2Q09WKzgr?=
 =?utf-8?B?akgrSUtSeDB2dEdtOXNSaUp5NWRBZDJCMU1jZnFtdlVNY1JDSmViRVBnRDNU?=
 =?utf-8?B?N1NZNjBkYW91cEJWWSt3aStzWG9nNHByVWFHQ1FkNTVHclpneWdHNEpFdEdP?=
 =?utf-8?B?VDYrZExFN0U2QzlMbjBuUGlocmJJV2tOOUZKbEZtalNrZXVrN2orbTNGWkZ5?=
 =?utf-8?B?cU4yaDRuS1B6UmJ5dHMvZDVlUmpFakFCNFpaekRVb25aTDMwbTBvUEhqZjF2?=
 =?utf-8?B?Yi94aFVWa3QrNkVVVm9URXdFVWtvK0FndjJ6TENtOWJ4cmZMN1lZMnZVZFdH?=
 =?utf-8?B?U3NUcndkWXJscm00NGx2cTFFM3FzcVNLUWV1OWNlVjBzWVVwZERzZi9QQlg4?=
 =?utf-8?B?U1NyMVJ5N1VDMVRHdmp1MStyN0JGSnFEUHB5Vld2enlzNVp1TnNzMEVyYlN6?=
 =?utf-8?B?SUxzQ0g4WEI1VUpxQzlhQmVZd0xkd0dVR1JFdExiR3pURG5abGhoZjM5NVFp?=
 =?utf-8?B?VDhudmViVEZjbzA2MXQzTWxkNDJqYUpWSlZiREVhdkZMU1AySDRqTW1lQUw3?=
 =?utf-8?Q?w/WTgmyVogeD6JbFm71GyFPPS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28dc7fda-f016-4507-9d32-08de0810e876
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 15:23:04.7520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QPdFNBdfeHed8sWS7F5JUpXv2/MmUJ7lNKSmhFAjwMdMUEWCJW4Pt4ZB1g9s/a2Hozr9KqR9nhNAmWl2Qr4cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF665EE4E73
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



On 10/10/2025 4:49 AM, Alexandre Courbot wrote:
> On Fri Oct 10, 2025 at 6:33 AM JST, Joel Fernandes wrote:
>> Hi Alex,
>>
>> Great effort, thanks. I replied with few comments below. Since the patch is
>> large, it would be great if could be possibly split. Maybe the From
>> primitives deserve a separate patch.
> 
> I'm all for smaller patches when it makes reviewing easier, but in this
> case all it would achieve is making the second patch append code right
> after the next. :) Is there a benefit in doing so?

I think there is a benefit, because reviewers don't have to scroll through huge
emails :). Plus separate commit messages would be added in too, to reason about
new code. There's other possible logical splits too, was just giving example but
I am Ok with it if you still want to keep it singular. :)

>>> +impl<const NUM_BITS: u32> Boundable<NUM_BITS> for u16 {
>>> +    const MASK: u16 = crate::bits::genmask_u16(0..=(NUM_BITS - 1));
>>> +}
>>> +
>>> +impl<const NUM_BITS: u32> Boundable<NUM_BITS> for u32 {
>>> +    const MASK: u32 = crate::bits::genmask_u32(0..=(NUM_BITS - 1));
>>> +}
>>> +
>>> +impl<const NUM_BITS: u32> Boundable<NUM_BITS> for u64 {
>>> +    const MASK: u64 = crate::bits::genmask_u64(0..=(NUM_BITS - 1));
>>> +}
>>> +
>>> +impl<T, const NUM_BITS: u32> BoundedInt<T, NUM_BITS>
>>> +where
>>> +    T: Boundable<NUM_BITS>,
>>> +{
>>> +    /// Checks that `value` is valid for this type at compile-time and build a new value.
>>> +    ///
>>> +    /// This relies on [`build_assert!`] to perform validation at compile-time. If `value` cannot
>>> +    /// be inferred to be in bounds at compile-time, use the fallible [`Self::try_new`] instead.
>>> +    ///
>>> +    /// When possible, use one of the `new_const` methods instead of this method as it statically
>>> +    /// validates `value` instead of relying on the compiler's optimizations.
>>
>> This sounds like, users might use the less-optimal API first with the same
>> build_assert issues we had with the IO accessors, since new() sounds very obvious.
>> How about the following naming?
>>
>> new::<VALUE>()        // Primary constructor for constants using const generics.
>> try_new(value)        // Keep as-is for fallible runtime
>> new_from_expr(value)  // For compile-time validated runtime values
>>
>> If new::<VALUE>() does not work for the user, the compiler will fail.
>>
>> Or, new_from_expr() could be from_value(), Ok with either naming or a better name.
> 
> Agreed, the preferred method should appear first. IIRC Alice also made a
> similar suggestion about v1 during the DRM sync, sorry for not picking
> it up.

Cool, sounds good.

[..]>>> +    /// Returns the contained value as a primitive type.
>>> +    ///
>>> +    /// # Examples
>>> +    ///
>>> +    /// ```
>>> +    /// use kernel::num::BoundedInt;
>>> +    ///
>>> +    /// let v = BoundedInt::<u32, 4>::new_const::<7>();
>>> +    /// assert_eq!(v.get(), 7u32);
>>> +    /// ```
>>> +    pub fn get(self) -> T {
>>> +        if !T::is_in_bounds(self.0) {
>>> +            // SAFETY: Per the invariants, `self.0` cannot have bits set outside of `MASK`, so
>>> +            // this block will
>>> +            // never be reached.
>>> +            unsafe { core::hint::unreachable_unchecked() }
>>> +        }
>>
>> Does this if block help the compiler generate better code? I wonder if code
>> gen could be checked to confirm the rationale.
> 
> Benno suggested that it would on a different patch:
> 
> https://lore.kernel.org/rust-for-linux/DBL1ZGZCSJF3.29HNS9BSN89C6@kernel.org/
> 
> OTOH as shown in patch 3/3, this doesn't exempt us from handling
> impossible values when using this in a match expression...

Interesting, TIL.

>>> +        self.0
>>> +    }
>>> +
>>> +    /// Increase the number of bits usable for `self`.
>>> +    ///
>>> +    /// This operation cannot fail.
>>> +    ///
>>> +    /// # Examples
>>> +    ///
>>> +    /// ```
>>> +    /// use kernel::num::BoundedInt;
>>> +    ///
>>> +    /// let v = BoundedInt::<u32, 4>::new_const::<7>();
>>> +    /// let larger_v = v.enlarge::<12>();
>>> +    /// // The contained values are equal even though `larger_v` has a bigger capacity.
>>> +    /// assert_eq!(larger_v, v);
>>> +    /// ```
>>> +    pub const fn enlarge<const NEW_NUM_BITS: u32>(self) -> BoundedInt<T, NEW_NUM_BITS>
>>> +    where
>>> +        T: Boundable<NEW_NUM_BITS>,
>>> +        T: Copy,
>>
>> Boundable already implies copy so T: Copy is redundant.
> 
> Thanks. I need to do a thorough review of all the contraints as I've
> changed them quite a bit as the implementation matured.

Cool. :)

>> [...]
>>> +impl_const_new!(u8 u16 u32 u64);
>>> +
>>> +/// Declares a new `$trait` and implements it for all bounded types represented using `$num_bits`.
>>> +///
>>> +/// This is used to declare properties as traits that we can use for later implementations.
>>> +macro_rules! impl_size_rule {
>>> +    ($trait:ident, $($num_bits:literal)*) => {
>>> +        trait $trait {}
>>> +
>>> +        $(
>>> +        impl<T> $trait for BoundedInt<T, $num_bits> where T: Boundable<$num_bits> {}
>>> +        )*
>>> +    };
>>> +}
>>> +
>>> +// Bounds that are larger than a `u64`.
>>> +impl_size_rule!(LargerThanU64, 64);
>>> +
>>> +// Bounds that are larger than a `u32`.
>>> +impl_size_rule!(LargerThanU32,
>>> +    32 33 34 35 36 37 38 39
>>
>> If num_bits == 32 (number of bits), how could BoundedInt<T, 32> a
>> LargerThanU32? It should be AtleastU32 or something.
>>
>> Or the above list should start from 33. Only a >= 33-bit wide integer can be
>> LargerThanU32.
> 
> The name is a bit ambiguous indeed. An accurate one would be
> `LargerOrEqualThanU32`, but `AtLeastU32` should also work.
Sure, I prefer AtLeastU32 since it is shorter :)

thanks,

 - Joel



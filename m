Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 646EAC6C731
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 03:51:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E155610E060;
	Wed, 19 Nov 2025 02:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uStcZkd2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011068.outbound.protection.outlook.com [40.107.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCEF10E060;
 Wed, 19 Nov 2025 02:51:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aonmvT4xTkgGBLfFFIZ3JqGsbEA5K1tPADkcaAcig47Pud0L5QvLRls5HytpoL9wBYgc0CbBhRsIz+qUkpFzS9aIi1v7V+bO6vudQ30T+e0oZEgCZWHaT64oJcYPyTPtpg7j0kTMntG/s4lcvD4eaU+Z+iGG7zg6yoJaRmpwFQqGyEtrFyRlYgNIIzzYkpLTx0GcJZfcfXM1EzKD12zUMYfd/KvUkUQU0yWYORiQRZfvWStXK3DuXjYbVM2qlvKpxqO85nfYKya83FsqRhAiymUYbc2kqs4gqZ/iwilWs2Jgu+q6sdcv9QeM1wcWl574QfSzXDhPhRACz0XM3FZa0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y95juH55gMl6gez5pkWcJPiigRoUojmuatECESQLZbk=;
 b=iUYwvrZYYpiZ32l+0r4GjkOS2ZaVuw0PfQ5L7ot1JvcKYJl/nxmLaTZ/z+gAe1apn9lyfaDCvlNfOFRaoiqwYSCnio3gt1Pw3WYZrbLnQ+9TggikjFUTL/yrT7mDF7EnprGCPBVFj94qG0JgOqZbZvbTaHLDpQvn3bUjbdJUJlMZwmNp7qLfDaKXVseQ4FuGSWYERV3m2M6xpdTnkxEk96lcmXK5HsdVbFYzOu+e6e98FnMrXa05Cko2cIkYmcNnaxmIKEjZsciYdk3XISQn3I1xGvA+HczklzJqPJkbbdyLBM2Xgh/S2lAZf8cFZQU07oBDcCWKN/IDbH6dfvMD+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y95juH55gMl6gez5pkWcJPiigRoUojmuatECESQLZbk=;
 b=uStcZkd2O2FviEqVTlVGr+GXwmgZAyinCYK94RG8GcCBDGy9UyHyoEkJSdHfWPwKf/oHN1nVieOyOCs6249P9assnlUphv7rxf0okUtkcM8ygVJ8c6g2/C69cxQal0ZyH5vmKyRwid0aC4/kRfRqa4IohEc8m9WtuuRmP5GT64fCasMyr+5IDjVfz3A7k2NJO4fQHf+LxhbRpCN807KhuKMyVOwS0C9ZiDwnR3UDzBds4B6dmCAG73NBthUfe3IKpLLzSbogmXZAww6UfYPQUk9n6uijequR3nUP2xBh7eDfVLvGpT2kNnR8SpvlISMyyMipyoWENbSGFS8y335YvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB9471.namprd12.prod.outlook.com (2603:10b6:806:458::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 02:51:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 02:51:37 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 11:51:33 +0900
Message-Id: <DECBWUFEHV5D.3O0TH2AL775C0@nvidia.com>
Cc: "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-4-ttabi@nvidia.com>
In-Reply-To: <20251114233045.2512853-4-ttabi@nvidia.com>
X-ClientProxiedBy: OS0PR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:604:98::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB9471:EE_
X-MS-Office365-Filtering-Correlation-Id: f09d7aab-a673-4e87-384f-08de27168efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0pKQ1U2dWxJSmQzc2dEK2p0UmFCdHd5ZEU0OXhwcy9KYzR3RHcvc0diQm5P?=
 =?utf-8?B?RFEwcHlFeFNMU0dUM2JzTjJKSGFVb01OVGx4cTUzODF3OHVjRkU2OW9IMUs3?=
 =?utf-8?B?ekRmdnFzS0JmcnlIckdORUJMSEJjZkxUTGMyUjhCSnIvZ0lXRGV0LzNkZi9H?=
 =?utf-8?B?ZDBaaW9rRmpoVEdOQjByVE5lM09FaUtGRGQzSXJDWGVDZEZvcHlQYjYxYVgy?=
 =?utf-8?B?NmZxMkVTb1BIQnBXZDVzUWV0TjhYY0hxQzZvSjlFKytHUHE0eGlycElCaVJV?=
 =?utf-8?B?UGtYUTJBekx0M0IyZ2d3Rk9memJRM2tvazhJQmJDd3Q1elFYaGxNSjd4S0I2?=
 =?utf-8?B?R1JIWUZGZUFGOWRjVFlaUVJXZ0JaSUdodjYvMkp4dEJOYWhwTVRhbXMwNkFB?=
 =?utf-8?B?SzE1ajVRZmtJbG43S29POHBlQ1d1ci9EY2VPSXBCcTRuRGxGK2xSODdJZHdq?=
 =?utf-8?B?Zmc3Ynh1KzhZYzh5dGMrWEhsSFlSc3ZrZExJWTliR2lWdU94N1I3MmJmUm5Z?=
 =?utf-8?B?TXN3RHRNRUw1OEYvYzdOY0pHQmtwTkpDSjNVV2FoQitzVWlYUnAvd250Wmdm?=
 =?utf-8?B?U2Y4b0lhSkdYbzFGdWJORTZ1QkUwU2FYUWZqcHNncDRGc2lKWEtlTVI3eUNu?=
 =?utf-8?B?VkRLV0I3d1VqaVpNcDAwSC80eHZ4bzBwcGlIdUE1aUhlTzB5TGt1Tnh5NEJn?=
 =?utf-8?B?U2Z6YSt1OE9MQ2RReEVhNmMxZERtRWYrWUt6YXQwdDZNNjJaaU9McFBTSk4x?=
 =?utf-8?B?dGRzcmxjTTMwNjducWdETVBIL1VwTFRPYkNkemY3TWI1d21GcmhlV09KYW5a?=
 =?utf-8?B?TXFDcHpFRjlSTGhoNXI5eS9oWkdhU3pCaWZTek1MRVBYOXhqTWNxZC9aUklE?=
 =?utf-8?B?WGlidXh4NXhtcnlrL2E2eGVsY0ZVQ3lOaG8rYUV0a2tNamRPZ1diM0R2UVRS?=
 =?utf-8?B?eFlzdmlwRVliaXJRR0lldTZLQTYzME9NS3B1TVRsNExPR3dETEFFaHVkajJv?=
 =?utf-8?B?Tzhod25UaFVSU3hVQXJmTnhmTkR0QkZMTVRyVHRUQ1Vab29JdDM5SE5wZzR2?=
 =?utf-8?B?OWlJN04rT29pbFZlcWdpaDRpbXlZa3hwQ3VYTXJzN1V6ZU1XdXhnWkxPYnhs?=
 =?utf-8?B?amc2UjBsTE5seGpFT3hyU3RWYmxvV2Y2WG9IVXVvZWNDMnFBbGhNZE5xK3da?=
 =?utf-8?B?ZHFDWnVCM2RvMHhna044U3VwbVduQWRhdVR6WUlPTGtyRGhnNzVFNUk2RnBq?=
 =?utf-8?B?QTR6Mjc5d0hGVm40M3UzbWxrV1N0NEJvOUJwUGdmQjVTR0JBVFhWcytWTFBL?=
 =?utf-8?B?bkFCb2N0TFRQcnk3VkdDR1I3ckVxUEZWNGttaGhZaXpOSVpCUjdydkVUUGxq?=
 =?utf-8?B?V3BTcEoyUGFEMkRmNEs4UFhkd2F3NCtwdDROLzdRZXJQeDVMOGNYL0JrVnNh?=
 =?utf-8?B?TnY2UDFTM1lRWTQ4SFBvWXd0OFl1MW5wT3RIclRLbGtJYnNhcTVsSCtFQlVt?=
 =?utf-8?B?ZW9CZ09GbDlOTFZVb0haV2JuZmo3bFpWOHFDZmV2QlF6YzhjdEhJdTFFT3Ar?=
 =?utf-8?B?U0l4VkVaemdPY2lTUmdsaXkvcFdUaEQzY0xsb1d4OHJPbmVnZ0pLL1YvYUNu?=
 =?utf-8?B?ZXVZWkU3K092WHpmQVljZjlRejV2ME94c1UzajRUU29JMW8raUFZRUtrUm9V?=
 =?utf-8?B?K2c5TmlGOUNPODJNTmszT2Z3VkgzU3VRSlhtWHVoeVhCRHoxaG82SllVNE5Z?=
 =?utf-8?B?eHpiN21xL1psM2JabFpaemFqOWFjZ1Y1dFNkWDhZZ0ZEOGRQSkd2Q3FMRU9y?=
 =?utf-8?B?Nm5SdTdNS0h4WGhtYXdMblg0SlcwY3VUVXJtRXNrT0pieEk2MDRQODVlTHIx?=
 =?utf-8?B?VVk3eVArcEU4UGNFbnNsb1BIbTFqM2xBZEx4ZFlrSTJvRGRTN21zODMrdFg1?=
 =?utf-8?Q?y5KiMSKh1iKFuB0I7ea4+EcAqyzgIfAt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3phY1dITUtIbWh2M2hEWUxYb1QySncwMkMxTG9yNzJiWjdzdWpyeWZZT3ho?=
 =?utf-8?B?bTB0NDNYNmJ6b3NiR2E1N0kvVWN6SklycEk3d1gyOVQ3THRtZkRCVVY2K1o1?=
 =?utf-8?B?QlJnL1lBME5jTis0UFhiMW9uRzZ3bDZiUG85QTVBZWJIbU9iUHV3NVpDalBQ?=
 =?utf-8?B?WHA3K2dVUFUvaTRoS0F1L3dRKzNEV1IxbE5Rek0vdEpJVkxwUWZBYjJBZm1H?=
 =?utf-8?B?Rzd1Q3h5TTRJVkh4L0VYeWJuRTl4dGI1VkM3UWR0MDc4ZVIyczBZZ2VkU3lU?=
 =?utf-8?B?NHBoVWE5dlNqQVloRGxuVms0cWJIL0g5OFFBaG5tMmswemJtZkYzRFQrbDlU?=
 =?utf-8?B?MlVsdCt5NlVZUTc3czNKRUhUR0RrY3R1NmRkYXhOM2R6WEZnZk1YWlRWcVUz?=
 =?utf-8?B?TVhzbExjVnJORUV4dEtQditjUGJ3MmV5Wk9zOGdvTHF4eTFVN2VvUUVaMDM1?=
 =?utf-8?B?NGM4WlpmakU3MEYrMFB1Zjc1Q0VMcVpNY05CUENZR2hSZkV0MWhnN2pRckM1?=
 =?utf-8?B?c2pnSnNyd0ZuOW5BVzNMR0U1M0ljaWYwMHNHRWdYeGFZdmtsY3JrV2FWYjBw?=
 =?utf-8?B?bmpOSWVNWXRRaVBFZXQxeTVuMUNmRjFaYmpocm5YYXhLVEFFdmpXZFU4M2F6?=
 =?utf-8?B?bU1WZVlUSGVVdXJ4RE1OQzZ1enpSVnVOV3gxR3pGZUJINll1RWRaS2Q5RzVq?=
 =?utf-8?B?K1RNa01wQ3Jyc2JHOEo3Yjd3UzNqYjlnWVBoWVBvSnJkUTR3VGQxK1BJOTFh?=
 =?utf-8?B?QWlrZkQ5bXk1UGdzMk5taDloYlhha1lrdzVQRjVpbXhtU3EvQmVkVStWeG1I?=
 =?utf-8?B?NHdIYzdlbDNyZTMzeUkwQUU1bHYvSmdXLysvbk1kc3M5UzdtaEhLbjVlZnJw?=
 =?utf-8?B?ZGIyNGt4Q1ZXUy9yWERBM0N5QmFBOWdzY3dSaVRYVTRuMkQxRHkyRXNnalVG?=
 =?utf-8?B?bXJGNDlmVmhNYmZZaE5rOEpyenlyUG1aeWZuM0gxeHlxNGJMMWdhZGI0ZXBz?=
 =?utf-8?B?MjJSWk90azVaK2RINDJxYmRtcHhMamdiK2k1azdGZkNCYVBMZ2lNckVGOWdC?=
 =?utf-8?B?MlpUYVNqb2QrWnFyNDJjekRJdmJsRlFXTjJibHhxZURQQ0dxbm01WjRzSWlH?=
 =?utf-8?B?dE9MWk0ydnNySlFvWmhKelFNLzlOdko5ZmdaMmlERWJ4RmNock54aTUzY3BZ?=
 =?utf-8?B?SGhIMG1FV2l0dTg3WEtuaWxjYWJnWUMycVI2cVNzZXBHMXVnK0Z6ZEtQMnBL?=
 =?utf-8?B?c3VEUWFoeWdNL0RvZ2IveWhpaUwrVzJKMTFyaFVMeWFNc2tmL09PSFBWNnRh?=
 =?utf-8?B?czZYQTJvMkErdDkzNUF3c2JSa3QvMnhUcHpGLzY3RDN5czFid2dEUTdCanNC?=
 =?utf-8?B?VEU5b2lJZHFrUGFQUFJaQlZ4T0VlN3E0a2xsR0gvNlE3VjlwV0VzdURuZkRt?=
 =?utf-8?B?VVJDaXpQSTkvZjFRZElISTdEa3E2QURYUGxyZ2hpNHlmclVRT3FYSEllTUhZ?=
 =?utf-8?B?cjhsaHRtdzU4VVR5Smc2WkJFenh3WUVnK3lVVmEyZVJ0ejVlSEM4Q0syT1lP?=
 =?utf-8?B?WjJvK3NLTjQyNTlIWmJFY0I0dHczZkxxcmpjNGFTenNWY1c1c2luampZekhJ?=
 =?utf-8?B?c2lQTHF1YWVmWTRFQXp4RUxMUjZ4SzZhZzk4VVpMbFFvK0Jhc2ZtaE4wdjhj?=
 =?utf-8?B?MEtFdzk5VFhlUkVHdWpRVENQWFdrU3E4Qi8vc3l1eVA1aFJ6TW1qV3JPN1hT?=
 =?utf-8?B?V1BEdEhiOWhwODAvWHZ4NnNSMUJtN3ZsQlZXcnVydWdvUXV3UlNYWktxWVUv?=
 =?utf-8?B?OC9JNW1zelhIUjlvVWUybnBYeUVKSDhiSWZLR3AxOGVjMTNiNlQzU1hWaHdC?=
 =?utf-8?B?MzVXc1JuMFRRV3ErQmVld0ljWitXejBRTFRUaWpWTitoT1dkajVwUWliRlF0?=
 =?utf-8?B?YkZTMEptR0lYRndyMzlJdUdIemlRK3AreHNBb2V1Q2pja3pmUEp2aGM1cFdV?=
 =?utf-8?B?dnRES0VsYUxueWprMHI3OGRSWDV6d0diSHdXQ08rZGl3V1IyVSs4SHVoQmZ1?=
 =?utf-8?B?cFUxeG5GcStDeWt6a0VEY3NYZEVEUUZ1VVp1VUQyQ1R3RlBMSFh5bDlXTFlV?=
 =?utf-8?B?dXd3Nm5oRjRZdzVGQUdiN01KQ0R4dEgwOUJUSTV2N3FLS0plS1M0SFFOaFNn?=
 =?utf-8?Q?u4BJPCy/l/NO0t9GxJwohl1Hj0ANECmfPP4AtOhBkpfy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f09d7aab-a673-4e87-384f-08de27168efd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 02:51:37.6305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJWTG2O6JEVdw6PqAebSgaIgfQumbfCORF/Yf+RkIet1+4uNvtzvslhfD2eh5AqLnoifyNuVStZy5uJiuf056Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9471
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

On Sat Nov 15, 2025 at 8:30 AM JST, Timur Tabi wrote:
> The Turing/GA100 version of Booter is slightly different from the
> GA102+ version.  The headers are the same, but different fields of
> the headers are used to identify the IMEM section.  In addition,
> there is an NMEM section on Turing/GA100.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/booter.rs | 40 +++++++++++++++++++-----
>  1 file changed, 33 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-=
core/firmware/booter.rs
> index 1b98bb47424c..6ac9593504db 100644
> --- a/drivers/gpu/nova-core/firmware/booter.rs
> +++ b/drivers/gpu/nova-core/firmware/booter.rs
> @@ -356,14 +356,34 @@ pub(crate) fn new(
>              }
>          };
> =20
> +        // There are two versions of Booter, one for Turing/GA100, and a=
nother for
> +        // GA102+.  The extraction of the IMEM sections differs between =
the two
> +        // versions.  Unfortunately, the file names are the same, and th=
e headers
> +        // don't indicate the versions.  The only way to differentiate i=
s by the Chipset.
> +
>          Ok(Self {
> -            imem_sec_load_target: FalconLoadTarget {
> -                src_start: app0.offset,
> -                dst_start: 0,
> -                len: app0.len,
> +            imem_sec_load_target: if chipset > Chipset::GA100 {
> +                FalconLoadTarget {
> +                    src_start: app0.offset,
> +                    dst_start: 0,
> +                    len: app0.len,
> +                }
> +            } else {
> +                FalconLoadTarget {
> +                    src_start: load_hdr.os_code_size,
> +                    dst_start: app0.offset,
> +                    len: app0.len,
> +                }
> +            },
> +            imem_ns_load_target: if chipset > Chipset::GA100 {
> +                None
> +            } else {
> +                Some(FalconLoadTarget {
> +                    src_start: 0,
> +                    dst_start: load_hdr.os_code_offset,
> +                    len: load_hdr.os_code_size,
> +                })

I'd prefer if we could reason in terms of functionality instead of
specific chipset versions.

IIUC the relevant factor is that Turing/GA100 have some non-secure
bootloader code as the entry point of booter, which GA102+ doesn't
feature as it is capable of starting in secure mode directly (please
correct me as my understanding is probably incomplete if not outright
wrong).

What is the HW or SW fact that requires this on Turing? Is it linked
to the fact we need to use PIO for it? What I would like to achieve is
removing or at least reducing these chipset checks into one single
point, which in the worst case could be a method of `Chipset` telling us
which loading method to use. But if we can find a distinguishing factor
in the parsed by this method, that would be even better.

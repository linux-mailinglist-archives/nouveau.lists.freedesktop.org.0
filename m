Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD5CC6C7CD
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 03:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8368810E219;
	Wed, 19 Nov 2025 02:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ondKR6RG";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010002.outbound.protection.outlook.com
 [52.101.193.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAB310E219;
 Wed, 19 Nov 2025 02:59:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oifFRkwEGuWbRZ8wtfJiLyhvLogxL3zl/LzV9XaduHq1FnfSjzsYPzXUPzzOWes4r0PnK3eZBMEuWPJxFHyxu7SQgOuHEPxextF8nW/GzKURc8SoPn+tLUMwT2j5vPCJVffSkMcWnlIXfB+XvZU4Rb69lmJ+62uvp1QFWAst6Vvx7IEplcW8zjsOQaiM//e3yD1gUJdstilHdTN4XZGSMJLcjFhLbsf0AZAUAwPpadUSIdQDGv8qchvovTSt5IPfp+teZUvelLVayaADBpFOf3sJOnMyxTm7qgPvjtimZTtdUhYie21hTEWBk+QsKxpfX2fODDnCyKAZbrO0AfxjLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVPnUWxnglbDCKXm2jQWqrX9b5kIH+TPc40yevlKFfs=;
 b=CoKttpA1bMHnBec7d+vZOWkamKRAk445oc8BYMYFaVgQwKCSa8wMtPp9bRwJY0Alh6BnTtGhbnXs6ZlUXN+W42OmfvkRZUvY6ZM8EfXFSV56wdgT2AXf634dXAomOwITYHxiNCNwrtcQTWuZqxrxjjyDEy1lNpt8e7vjcyM+cgj4mNjPGFBxEVQjyiwT8ZqUAYGNWqoZC6GShV75rzl8Y/Iw6lBtr9qas/43cIZRCDzTeqLum+ci0XQSHw8NvUmw1gaoDQ3ERv4EQ+Fvdfbfktz+DTM0MqJVcMBkwmoJPvnG5bJdL3IxkSiexrMyqLB/CabvqaS3JLXXRrJcmh7F/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVPnUWxnglbDCKXm2jQWqrX9b5kIH+TPc40yevlKFfs=;
 b=ondKR6RGWH2pRzQYiq8qS3RDvgFrY4IA/MZICvA04jyPRxg0K8WlXJ9zTTXfT23zcrabx1RlL3nd9Jx9LWG6aI7wVk6ku1iU+5/UbFo7f85wfoeJ446NPRVZ0xffj/hJz6zTteFoWutqGtjh4E8rCwGVLzQwRwQ1ZJlmLxv141kMM5u738qdqRwRsmjlbwCUlzeHdv2arlLLxfN2GJsQmJYLz9wkR4D6OKm3Cbj6a9ZGWk03AX7ZDp8aMU2xSAoxxI6CRsqXJIOQlMyAmUClQwheVlon2rdZNfw/H3r9wWntoFHZfcgCdr8u5eRhz5kZ8RefAot6JmNp8FebPpQ/Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB9471.namprd12.prod.outlook.com (2603:10b6:806:458::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 02:59:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 02:59:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 11:59:08 +0900
Message-Id: <DECC2NFSLDLN.236BCLPYHUVNI@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 04/11] gpu: nova-core: add support for Turing/GA100
 fwsignature
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-5-ttabi@nvidia.com>
In-Reply-To: <20251114233045.2512853-5-ttabi@nvidia.com>
X-ClientProxiedBy: OSTPR01CA0083.jpnprd01.prod.outlook.com
 (2603:1096:604:218::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB9471:EE_
X-MS-Office365-Filtering-Correlation-Id: f1cea7cf-9069-4a12-1a57-08de27179dd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nmh4NHVMemxQQ2JvYjVBdDI1dnMwQnlLWXV6Z2Y3YnlxWGRrRDV0VEU4b08w?=
 =?utf-8?B?WVZjMkdjdzVSUEZJWk4yUmRrNmlDbEwxbFBYU0lVSzQ0cDFMNkFIN3drbDN4?=
 =?utf-8?B?TGhvbGFFN3grRkNsdDZkbXU1aGFtaVk5WmR6T3dRWEdybW1zSW9wNzZSVGEv?=
 =?utf-8?B?Z3VvY3hGa1R1M1hRa1RhZTg4UWUxVjBERVBpd1NkUUxTUnFIWE9KREdkNURD?=
 =?utf-8?B?MlNFNi9PSjBsOTVkMnB2R0kwUmgyZXp0Wk13MXVHV0N0S28rSVNiZ3czZzVY?=
 =?utf-8?B?OFZYMjhSb2QxOG9jK1JhN0M2V3lzUDllbmIzYlRIYWFTQVBVclJjNjJTUnBW?=
 =?utf-8?B?cGN6ekxqcGk2TmNaeU4zZFVCM0kyN3ZuZW95ajhGZWpRRGptRDdPR1BKeFE3?=
 =?utf-8?B?ZldXWStzOWhmUEhzK3ByY1hKM0dJWXFicVQzMzJQY2V1bzQwaDNyaXpDMTY5?=
 =?utf-8?B?RFZjVkxPR0ZjTU1PbDFoakI3dkFPNjMyeHdIcHJhOUpmc2dBMWZjYlVRcWdS?=
 =?utf-8?B?L1VhdjNJaUl1QWhBSG01UmdRbHB1VW4vNzNZMVRmbmE4aXJmeGFnMXhiZEgr?=
 =?utf-8?B?VGI3aVJvUWlPNUJtWGk5OXMvcFZrbnE5T2Qwakp2cFY5ZllIT2ExRlcvSDRV?=
 =?utf-8?B?ZytncmRUV09RTU5NNnlHTVplTm9MZm1OdThlYTgyNVBLWVNycFM4VzFiQ3Bl?=
 =?utf-8?B?WWgzaHRzeUpBZGF0SXNBZ2RiR0lkU2tvbmZ4ZnlYa0ZDZnZQUGt4VnNYSGdU?=
 =?utf-8?B?S0ZadFRFY0pxSHkzUHI5NGF2RnFza2tZT1FCeUk5MmtJTURpVzF2bk5Za2VV?=
 =?utf-8?B?Q3A4TnpRSVd5azNkTWlkVlJkRFdzbEVzaDl3TzJBbG1NVXNzck1qSGZDdk1B?=
 =?utf-8?B?Y3FQeXhLUnFTUTZCeWxoN2FCZzBuRGFlSHVpSDE1UjAvS2YvTWVRY2dlK1Zx?=
 =?utf-8?B?cXV0bS9SOGNtN0FpNENkZHMybWJobWo3M3dVR1p4SUZ0UzMrcXRBc3RPczBS?=
 =?utf-8?B?SzFPUVJIWVpYVlA0ZHlXOHdyVkpCWmlYQ2FYZHVaa2JjSWduT0hZWTJwM0lY?=
 =?utf-8?B?ckhRTnZkQmV5Qy9RcGNvWCtLaUVQWk9tSlZoSEZWQTRxaWVwUTdLRUR0YWxn?=
 =?utf-8?B?ZXNmNlhVQnNwRnlqbUY2ODdqMHdDRzMxMjJSdXBKZXR4ZVlwSnVuUUpGaTc4?=
 =?utf-8?B?Y0pSK3lWcDd4RmdaRnE1MkRiTzVucWdrakc0dFo3YytCeG1pMEtyZHZFR2hT?=
 =?utf-8?B?WmtTd2F1TWZpcHo5d0dmczNSVHBzajQ4b1AyWkFPM2xGd3U3U0l5bVE4M1VN?=
 =?utf-8?B?bmplNHBOcWlvNW1lOEJCSDlSNlVvSU04a2JWN05lRFV1Ujh5SlJMdUovSnd0?=
 =?utf-8?B?WHdjWmV2MjNDQ1Q1NWszYXlYS1Y2VjdVMzNCQVArSVlkVDU0dnRRVFYzakxF?=
 =?utf-8?B?U0E0MGhuSHBJWjZjR1cyUGE2bUZjZ3lZSjFGMFpsRDlWakJrRklIUkkzSHRB?=
 =?utf-8?B?SkhCRFoyYUdEUVY1Rk5Gb3ovOEMvcmhGeDE2bFl0bXdPczROcHRpTmJSdmtz?=
 =?utf-8?B?YkdNZ2NWMTE1bGlvZWlJNjgzU2MvZWQ4eTBZTFZSRm8xYTEyaktBS0N0VVpO?=
 =?utf-8?B?d0U5U0NleUF1RTVqWnZhODJPZjhydlNnby9YT3FhdW41VGxWVW1PK0JtR1BL?=
 =?utf-8?B?M2JvQjZ2ZEp3c0JVVkJCL3hPQ0FiUGRuM1pyVHdsOHVXckUzVGpGUXhJTnh3?=
 =?utf-8?B?MVJJOEFyUUJaUENaN2I5MUxvS2JFejg3U3dMbkQ0RFdUZG5TOW81U3JxczRm?=
 =?utf-8?B?SzZmRzlNc2tzbUNpVTlVeGVtd0l5Qm0zMURiQUVpWExtbXJEQW4wWVY1d3pP?=
 =?utf-8?B?UklCeHBYNGVFSTdPMDQ3aVZNWkcxTSthL2ZmQWJhc0tuQ1hPRzMrQXJsd1ZY?=
 =?utf-8?Q?vcpzH4vnFkJ3HMLK7EOXuLdbTU7/yUoc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTBoTXoyU0FYOWZRMTh5VE1UYk5pcWVub25hclA1UG5WQWt0dnhHeWVlc3Nq?=
 =?utf-8?B?a3A5MUR1LzBJNUtHbytGZDdBcUhRMTVwVlZpZEl0ZDRmaDNkaEx5TGxoK041?=
 =?utf-8?B?ZFQvbmpPWWoxTjlDSll4Z3FQVzZJWFlkYWdDOE81SWZFR1EwZEZaSXBENXg1?=
 =?utf-8?B?ZVZkSGQ2V1NBZFN0WURYSElTMGhnd3BLMTBDU0dsYjlpK1NZc21vbExZd2xt?=
 =?utf-8?B?K0VFT2gyTXdRZVI0V0ZEQ1l0NVREaGtmMUVuNGFyUlJMcXdOdG9maGpDbDVB?=
 =?utf-8?B?bXFmOWdMSFBpSnE2Q0xhSHFaaHgvQldUUHFTS1UvdHFTcHpHYzQrYmY0azN2?=
 =?utf-8?B?WE1zczVUZ1d5cDdUak5MY3JRdk1jVk1jM0tvdTF2alJqU0ZybXpXT0ZOVDV3?=
 =?utf-8?B?ZVVMM0p2WHRJckczL0NNSGhiVkJGYmVGb3RsZVJtTUYyT29jTTBFQjY2Smlv?=
 =?utf-8?B?NXNrSURNeXM2ZVFoK1hYb1NmMUxMWEdXc1o5K0Z3bUViT1ppRlpXdm44eDc2?=
 =?utf-8?B?c1lmeTB6dUFnK0JVdURmVjh5eEFVSUJ1WXJxWWVtSkhUMzhOejAzY2ZwZHpq?=
 =?utf-8?B?d3VsdEMweS9iM2VBdFZkQWM4WVFlZW5Db25VOEFDekxxMndBOXgwNkF3WERO?=
 =?utf-8?B?c0pkY082b0tQOG1hTW1GdlczbG1rbGQ1VnFZOWZ4Vk50TFJHMjhpdDl3Nk5k?=
 =?utf-8?B?dlc5M0Z5Q1RlQ3dOZjQ2eUhtS3NtME1OeDVzN1Q5ZjFvTG84NGlKUG9WejJN?=
 =?utf-8?B?ZitBOE51SllSbThLKzBMVm5hUkgzUXFnQlg0MCtMYXhGU0FRZTJ6TlJET25Z?=
 =?utf-8?B?S210Zmw3ZVhZb0h0N1hrYWx5Z0xNNThxYURVd0prRWg2VEVJRzhVYTAwNjZ2?=
 =?utf-8?B?MnA1bjhHUDFZdWVNSDFVdUJiRkk2ZkJPNXF1UTIxZlJiNWkvZnliWnZEdm1O?=
 =?utf-8?B?R1lMSmJVUW5nenNjaStqbUR1b1lsaXFtVWFCdmt5cmhHc0U2eTZLaEZ1Qmpz?=
 =?utf-8?B?bldFZ3ZFOGFNQmU3NGxWZ2JUdmhkY1FZcmVXclpjMHh1cXhqUlpLWjJVaUxh?=
 =?utf-8?B?T3YwN2dYVDJUZWhaQXFnK3M4M2NkWXQ0TzZBdjZyNGF2TGRuU3VGREc4ZmZK?=
 =?utf-8?B?ZGg5RXNPeFRudldGY0x3TEtyaDUwcVV1elArRnNCZ0R0OHJuNHRSZGE5ZERE?=
 =?utf-8?B?MHJFN2VQVU43QlRwWVNxUHlGcFZhOHlOd0JOekJhL2Z2Uk12ZHREY1BpK0Vn?=
 =?utf-8?B?dnFZWkZqRnpPeWRiMXlzdDVJOGd2dGNPQTY0UE1kV05sQm04R1pKdkg0d3FL?=
 =?utf-8?B?aFVYdmtSM2Z1bm9HK2ZOdXlFRjF6VGJGUXhPVDRnYkRkS0ltWDJlU2FPTGw0?=
 =?utf-8?B?V01sa05jTlE5RlV0M1BoTnVFYWxPdUF1MkhQRUpIVkd3b2JwZ29XVVFONzFz?=
 =?utf-8?B?RG5hMVFZUHlVNk4vVUtKeU9TNEZteWNLdEVleUFsekQraWJmWGpGOUZGK0Za?=
 =?utf-8?B?SnM0bEVmemIwRFZNNXFhL0orT2lOU1lxUmRNOVNXdEh6YmhMUDhxdFo3S1M5?=
 =?utf-8?B?V3JSRWJtVEIxQlhMd21lM0VsWk1HN0ZsWGFsdUd6bmQycnBMZTJtbFRMaWYr?=
 =?utf-8?B?UGZlNW8yb0Z3Q2tycy9DSWwrenYzNlBDRW81Y1BlL3VSZlpsMi9CdVhTbldN?=
 =?utf-8?B?RWhrdFFYb0MwaE5XQXNmVXhmWDFvdTgzWXJyYmlBbUluRUJJbmVzODBENG56?=
 =?utf-8?B?dldWcUI3ZDByMncxTmJGamdwNWFwZVJKYm15M0FGcFV1QjNzYVpRTzhJZjk4?=
 =?utf-8?B?dDFrNHdjbmNKNEdtdWgzMlNDYUxtSWNsN3RFWmppYXlkeW5SWEw4Q3gxV3R6?=
 =?utf-8?B?eEtVUUQ3QXZDcURsRTVpNkxOaENIenZFOHNLcjRrSGsyRDc3cTlzNWRtTFlp?=
 =?utf-8?B?eE5LYXVqaStsckFhTW94dXpMT0t4aVlsRTNlejZJSzJrTVFnZWYxRWowM3Mv?=
 =?utf-8?B?QXd0NFRPUkt3Z1hyZHd6amh5NU1MVmhsaDZvb1ptUU9xcGh6RzJtQ0FNMzgz?=
 =?utf-8?B?YWNBNnZRbXh4NTQ1a3ZUSzBrVmxCMmdtZWVMUzJsdHdabEs3L3lmUW8zSm9j?=
 =?utf-8?B?N3NkZWM2cC9JcVkwa0d5WjhqTnloQ3lCcWx5Tm51NmQ0aVVTRnE2UEtLRThm?=
 =?utf-8?Q?vBxSwsebkkYacfCJYUn+jKEou2+bkxN9T0W97cpCfDCS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1cea7cf-9069-4a12-1a57-08de27179dd6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 02:59:12.0693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tAlHiXNMMk2XgbfGZScUz/PebrBccDXx6O5ZrKlrG8Y2bQgpfDEkO9QeG5y5wh48o/hh098PEduUumXMy/UjYQ==
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
> Turing and GA100 share the same GSP-RM firmware binary, and the
> signature ELF section is labeled ".fwsignature_tu10x".
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/gsp.rs | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-cor=
e/firmware/gsp.rs
> index 0549805282ab..aa5a6433c377 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -163,9 +163,14 @@ pub(crate) fn new<'a, 'b>(
>          let fw_section =3D elf::elf64_section(fw.data(), ".fwimage").ok_=
or(EINVAL)?;
> =20
>          let sigs_section =3D match chipset.arch() {
> -            Architecture::Ampere =3D> ".fwsignature_ga10x",
> +            Architecture::Turing | Architecture::Ampere =3D>
> +                if chipset > Chipset::GA100 {
> +                    ".fwsignature_ga10x"
> +                } else {
> +                    // GA100 uses the same firmware as Turing
> +                    ".fwsignature_tu10x"
> +                },

Following up the point I raised on patch 3, this could be another site
where we use a potential `Chipset::has_bootloader_thing` or any more
fittingly named method.

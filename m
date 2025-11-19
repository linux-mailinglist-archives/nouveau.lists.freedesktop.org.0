Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D6EC6C44E
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 02:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C3510E013;
	Wed, 19 Nov 2025 01:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bzMVD1uR";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D52E10E013;
 Wed, 19 Nov 2025 01:36:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkRAuKnnsC4JgE4ILkGXYRyZv56GBKNgfUmWAO1jplZ3PcfFJgf38pA5kUY7yBXr/N4EN1bV9qiW2DqqSYGj2HimISw/DkszPOwcAAAZuONlgJhPocTUt69Znwb5cygvH+fbkByo5DSB676S3s+nMImH6gL4LnoVZ9pjDsG5cywoUafY4hbcUSbWpse2MSFQ4p0x20ZtDEParxHGahs3ltkol0yUADjFVkacQqKqGCz21q6ADXxm42LXqwkvw9xoGdMcl4qcz127LO2+oee2kvYL+vO45tyOZkA6W+4sa60SvSwY1CxLaTDX0QWcRoXqjAvS3KbGFqjzRPiGNvaL7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyPbAEYlnNYhUoNOhCLSL7/UviMIiS/j6fRLSqcC/bc=;
 b=T3kKQdI/8DTKWc6oifWmNG54WYfE9S/bu2HDG9+MZFJSxGdF3M1PwMmvxPHX41RqFPzrKw3+Oo5Bw79e7F1FYUQ7U5eeJMms58MDMZzUwzg4cJ8hLxPW9I9WWLxSr5FI13V7a85kgsHswq6ihjCGneC876arjFqaIjP3gxlPZ0PY6LO/LoAFyb8E/IbsO5Ic2MMki0I2dPFhXPUwa2wU6JczfJ7169GYtSJxlrVgBhD0nmA9GgRHSB421AKqgn/u590S8BU1+09+K0TqRpos446RPQahoOs53OnW+r4sfwEbbeJd5ZkaI+vClzNoIEY8sb1hlZ0FXdPcmQwIcVZnSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyPbAEYlnNYhUoNOhCLSL7/UviMIiS/j6fRLSqcC/bc=;
 b=bzMVD1uR/o+fpEIV0ba0n5tg66zSTdht8Ji9M9HoIR5xD1cy781hTJlt3/jJPKG6q5GDKZBfGrsB93zvH+Kp30v7T03TW0u1jdpSLIqp8jN/a3CHPOoXvvHtji1dwtfpK86IQ4qSJnjiMIEVkQ/HaTsxCBnZkDC6B9OFGi1bBGMF643b8jzVBXpa9DiBLvtZ4BQQszWiLdH1pQ9l9h0c95VEC0mxcYTruhjm3Yg9TdeUg0JM2RDzlrsF3T3/PHsvtAlz4A+39S1XBpSBomdyTGCEj98kHjmk4by9+NgV+wBHdyQBpxDGA2cINs7rBW867odCxrOAhH7s2aIWODvfvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8721.namprd12.prod.outlook.com (2603:10b6:806:38d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 01:36:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 01:36:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 10:36:13 +0900
Message-Id: <DECAB5ZSNBQ3.131W81BP60K5N@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>, "John Hubbard"
 <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 09/11] gpu: nova-core: add FalconUCodeDescV2 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-10-ttabi@nvidia.com>
 <20251117231028.GA1095236@joelbox2> <DEBUBWW4AF8H.S54ZKX607FND@nvidia.com>
 <7246f7239cef8a3e7dc6d3ca8ec9336821e88e6e.camel@nvidia.com>
In-Reply-To: <7246f7239cef8a3e7dc6d3ca8ec9336821e88e6e.camel@nvidia.com>
X-ClientProxiedBy: TYCP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8721:EE_
X-MS-Office365-Filtering-Correlation-Id: 7884be8e-7f75-4b3f-9378-08de270c087d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlR1L1hkVFpyUWpOQmNNRFJ3ZHBrcGhIMU1ZWWtTbnZzSnFTV3BETm5hQ2Fj?=
 =?utf-8?B?dE9ad2x4ZkhOUmw3WkJQSVI4ckYrbkh1eEZLa211VEVRbCt5K0YyUENuZUo0?=
 =?utf-8?B?YTdzTmNxemZwdDN5R3FYSGpSclcyN2pjZXRNM0E2Uzg5RnhsZHRSejdTUzBw?=
 =?utf-8?B?Y2xjZkhQeDFuNnZPU0ZjckJWQVdoSnNHb1pVUGd4aGVYSGdqcElsZWZMVGVt?=
 =?utf-8?B?ZFM3SFBxTTJmN0xwK241eU01Rk84Rmw4VDZLWWZVMktTeFhmUDhrdTVnRCtr?=
 =?utf-8?B?bTNGQ1lHVjgrMjB2S0h6TjlpVkF0bEJ2dHpDVnJPa24wVzVEWi9YNGpYQ0pI?=
 =?utf-8?B?a0h1Z1h5TndYeENOVnhHVnFEaCtDTEFQeERET003blZwZExmZUNadUNQVTNO?=
 =?utf-8?B?blkwNmxuY2hubVNjRDYyRm1IVU1HMitaNi9qL2svMVFUM1pRZWFNM2FuY3NQ?=
 =?utf-8?B?Nnh5a0w1Q3d4Y29FNDZxdUd1MXpGNTlhYU5RZ01KbzBQejBIRzVrKzdVTXQy?=
 =?utf-8?B?aEdENkRUL1lyU09kcGxLUnNqRFpGaTBxbkJMTWpDZkVkOU5zUTNOY3phRVNt?=
 =?utf-8?B?OExQV0dxR0tnUko1MHcvYTNhK0Q1NktLMmg4M3FUTzNmUUNLcWIwTHJFZmxo?=
 =?utf-8?B?TzRpS242SjBteU5EMjdkU1dXb0FiNVZoRE5vQW9ka3NhT0hmMnppTklQeHAv?=
 =?utf-8?B?SEgyeWpPV0JkaG9WVlZ1bG1TYWt2L0ZBR3YyaWE3SEVQOUtXbnJVZFIybTZZ?=
 =?utf-8?B?aE51b3AzUDU0QktXaHBGNDRiVmt3UUVlMzhVRnVhY2ZtZFRCc2RaYXFQQzll?=
 =?utf-8?B?am5Jb0JKQlNwRnhmeTc3M01xa3BlSXFERDRDWVREcFRwL0xEb25EMW1ON0k1?=
 =?utf-8?B?WER2Nk4wTC9oWGRKMHUraGVDeHd4THlKTmh6Tmt0WXdtbHFCSW1hTThidll1?=
 =?utf-8?B?Mk9xOFNDcEhCaVFoRXBLWHBhcjJiV1B5WklzbFNZdjkxSlV6ODI5RFhHTmpi?=
 =?utf-8?B?aVIyVm9sMnNCVnJENC9ZRkpQWm5PZXdROEM2UHFGWCtCV3dnV0ZpWXJST0kv?=
 =?utf-8?B?K25qQ2IybXZZRlQzWWg3RjVQSjQ4SFFZcnlwSGNoVjFpQnZPVDN5MmtnZFg4?=
 =?utf-8?B?UUZVdnZnYXZZekljNnFoeVl1N3dORnA2UWdaemhwUVRRNStOSXJ0VjVGQnor?=
 =?utf-8?B?aWpvQkE5SlA1L0RoeTMvbElsNm95QVFvV2hTb0hFYmtBZ3d4b3JnOHhkbDV4?=
 =?utf-8?B?a3R4OGk5WUpYTC9jVlFVcHhRcWFIUVo2dlRoK0dMeE9aTDMwSDJiam1HK3VD?=
 =?utf-8?B?dEt4S25kRFpsYkl2N3NKT0cvWldaaHMzY3k1eW1xS2lzbk03TklqeHp4YlRJ?=
 =?utf-8?B?S05KeGsrLzFZSDFhaHBsUnMvSjFTWE9kcUVGOWZNQVV2enhCSTlHaEt5N2kx?=
 =?utf-8?B?eU1qbzFZZTJvM1NvUXRmU0p2ZXc0SnJ0ZWNXbXd6N29Cd01lWGtUT3F4ZXRk?=
 =?utf-8?B?OS9pWmFOenFWclQxTCtCZW1QK3JqSVNpZVRsV0tNSko0M1ZEb21sdTRDb2Iw?=
 =?utf-8?B?ak1QbmdJMDFiZGovOU4yTy9janVCT2RNWHl5ZE1LYXM3aHdPZGZkeEE1MDZl?=
 =?utf-8?B?Q0xIaE1iTCtQM1NHdldPMzZRcks1UTNtLzNKZlJsRERTb05UbUVqL0xLcHBT?=
 =?utf-8?B?amY0aWk4SmlaYlBRMlV2WG1jLy9LSHd5NFl1Ky9qbm1SYzJWS0tNRFNDK2lL?=
 =?utf-8?B?SnZUYXdDQldtV3llc1QrMjF4VVRpbFUyZjFDL0trcGdCRTlqdnE2RzJ6QjZh?=
 =?utf-8?B?aHhCaHhtR0lnOVBDeklIYzd4bFFNNkpGSE91M2FoRXJVOEEyaThPN0VsUDda?=
 =?utf-8?B?RnV3TytGLzVtRDFLVlcxdzdvSzl6QSswaVdFT0RYSWRPcVpBWmUvb29oWUFZ?=
 =?utf-8?Q?kzMnJWd92g4RJHTPXAHFajYrQCH1zFa0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm5kUVdLeVRVaENYTnJpaWVVc05YWkxvN3lsb3BIckNDN2ZTNXVvMEFwWFpX?=
 =?utf-8?B?WFcweERMdTlNRHVVRkZjNGczcHdGeW9kcXdIbDhOMFd1Z0dZbEJDM3N4NnJN?=
 =?utf-8?B?cUFNTFVwcXNPZUFPeklYRFBVK1d4QXpVY01hNC9temRMZXpGVVMwZGtpNFc4?=
 =?utf-8?B?dm1ybE53bjhzQXcxUWNTdzFIcDdxVktTK3dzMjkrVmN2QisyM05UelpzRjcz?=
 =?utf-8?B?N0JuT2krdnV0SkNGeXZUTmZFTlBuQmRtTmVsK0pnYzhDWDk1OXlHRFhnSjQy?=
 =?utf-8?B?dXpJVWhKRG1GWFp5Mm0zbUZiV0JSRTRIamtWMFk1cmh5RTJxdlVlOXZoZitR?=
 =?utf-8?B?SDRObkhtbGNqTnd0SjJOYVlmTHVsOHF4R0d5ZjF0QlM1Y3FPRXJydFo2WGMv?=
 =?utf-8?B?MWdkRkpLNCtBR1lWdE9oUkZmOGRXUzlWenhmekZ4U1pSVG54ZUhFUlBlZDlx?=
 =?utf-8?B?ektzZnZaZGgvcUJBZS8xWE5pb20zUE5CMVl2aEROcEg0cGs4QXVLVitZWXlK?=
 =?utf-8?B?b1FMaS9JNGJnNmR3OE1hUWJ0Zk9YSlljUWk0S1VRL0dkOWlwMHh4cGlHR2NE?=
 =?utf-8?B?OXJHNjJtdjdaNFo3Ym00RzgzcVMxZjlJQUxVNE5WcnpVMFBJT3ViUUh2VWxL?=
 =?utf-8?B?eU40MGFudHpjdlpyZldnWHJkTmdYVDRndTY2QzJOajJKMXVOemoyVkxpYk1i?=
 =?utf-8?B?b0F1cTIxZ3ZzZ3JEQWd1QVE1ZitnMTJidTFLZ2lObWd5ei9mWWJoNUlRQ2hP?=
 =?utf-8?B?Nmpodjl5Qk02aU56QU9HY2FwV1o3ZXlJb1RZUVZkWStZWGNENE8velRnSEJ2?=
 =?utf-8?B?L3M2TjlRaVdnNCtMVU1OK3BsMWRERTlJaFR5c0Q0ZWdIT0QyeVhsSTJhVnlC?=
 =?utf-8?B?ZVEveTNWazl5NnZlY1RJd0ZXTmhhcVl0aWVFekZTNitpUUcrdmt6VFp4dEN4?=
 =?utf-8?B?K3F1RiszU0I1WnVoU3VBcHQyVGg4Yzh0azZWdy9OdWtGMUtvQ1hUUmg4bGpV?=
 =?utf-8?B?MmJWMDg4bDhtNE1RalJlMGtSQlpOWG9UZWwvK2dacUVHQnpmTDJ3Y25TRk8r?=
 =?utf-8?B?bGRYcUtvRWV5L29FT2YvMkhBQmt3bjROdm5VWTNWMWpCbkVrQ1VsRGJwOFIx?=
 =?utf-8?B?K1gwR0lLSnlIQlJRU2JCQVRZcjArZTl5dlYwSE9wcm56WGV6S2VKRHhrM3Ji?=
 =?utf-8?B?VndCQkY5dkF2UjFSelF2ZkU4Yi90aGVKSHRUQ2Jta05ITXJ0QWwzc0pOS1hU?=
 =?utf-8?B?Ry9mVjZxeVAwMDh6dXJPVDRjOGcrR2ZZaVFjekVZbDJFTXVBZjBZblk0WUE5?=
 =?utf-8?B?RHFIeUcwdGtpdUZJck5mWkYycE5Mdzh1THFBellUTmt3ZXU2SnNqcEpYd3hz?=
 =?utf-8?B?U1AvaEcyOGwvSGplRU1Vak04SEZBZEtzbUJ4bmJrZk42NC9ZR2E2OTc1V3A4?=
 =?utf-8?B?am44eXBVRGF3NW5ORml1MTJTNjY0aUM0UHB1bkVMY1lPWC9zZmxXZDZjMzN4?=
 =?utf-8?B?R2xoeUgzd0dDb1pFVnlUTTBvSFc3eTlNTXRhalVMcCtFQnZxekpuOTNPa1ZZ?=
 =?utf-8?B?a0RxNUxwWFBlVnlFb1FzQnRYTFIrbUV6NzhPekhPUzg3eUUxa2hCY1N3c2RP?=
 =?utf-8?B?SHFzOUp1clhvTVphbkUva0FNbS9iNWNZQjJMMkJTQUczSC8xRElRNUhUK2ky?=
 =?utf-8?B?dzNIZ3IwdUpxUEd1NlNONFhwRU5DeHRoOS9LZVJtbVdzSHhSdDdIL3dKT3ZQ?=
 =?utf-8?B?Rlo1eFZzK2pSTHVBZE0zRGI4LzFCVXQyVXBqUnh0YkRUOXZQT0MwN2diOWRY?=
 =?utf-8?B?RUxWVDQ0eGdSeU1mYnNhMXJoQTlORW5uVGFmbDJrQUREdEZJV21lL283KzZh?=
 =?utf-8?B?a0EzOWdYVUQycElvaG81dHB6dmtvdmR1cWVmK0FmVVhmYUlEczhiaDU2ZTFE?=
 =?utf-8?B?QnhnckkxV295TktpcnpWTXo0ck45cWxRS0hHdWJtV2FnNXdQT2pKSkV4a3d3?=
 =?utf-8?B?aEo1cmNISkJ0NjM1K0lzWkVPdHZPT2lPU1pKeUdMazdHMXJvWWQrek9LckZt?=
 =?utf-8?B?RHBtdFRjVWMrTkhDNXY2c2tEMU1BU0hlc2hjdDgxc1orZVI5RS9tUldFTjRq?=
 =?utf-8?B?M0NKN0NTdTkrK2ZmYllzSUQxNjcyZ3AyTFhpS3V0WmJmYWVHQTc4bjRXMlBT?=
 =?utf-8?Q?5n317vswFg8ahb9YkSKjiF+0glBGEudAx33MZ18Lcvea?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7884be8e-7f75-4b3f-9378-08de270c087d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 01:36:18.7886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZgd9tm3D4+rTYUticJFto4al2ZbIPMuZs3Vy5f21PdM+oYy2UXxj2UxMcUOwWINUDgwKw0RReJ1FK9eibUIGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8721
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

On Wed Nov 19, 2025 at 12:08 AM JST, Timur Tabi wrote:
> On Tue, 2025-11-18 at 22:04 +0900, Alexandre Courbot wrote:
>> On principle, I tend to agree. In practice, we will probably never have
>> more than these two variants, so we need to balance the benefit of a
>> trait against the overhead of defining it in the first place (there are
>> quite a few methods in there).
>>=20
>> Trait objects come with their own complications, i.e. you need to store
>> them on the heap if you need more than a short-lived reference - but in
>> our case the short-lived reference should be what we need anyway.
>
> So I would prefer not to rewrite everything, especially since you did tel=
l me early on than an
> enum was the right approach.

I cannot know the right approach early-on, all I do is provide
directions to explore, then we can focus on the one that looks the most
promising as we understand the shape the code is taking. If it turns out
it is not the one currently in use in the early patches, of course we
will adapt the code.

In this particular case using an enum still looks correct to me (mostly
because a trait object would probably end up requiring more code), but
there are other instances in the patchset where we will need to tune
the direction a bit now that we see the bigger picture.

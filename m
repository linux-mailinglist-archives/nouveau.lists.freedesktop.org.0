Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0201C6CBCB
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 05:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E15A10E575;
	Wed, 19 Nov 2025 04:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GG4kG9Xt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010017.outbound.protection.outlook.com [52.101.56.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A15610E576;
 Wed, 19 Nov 2025 04:28:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kx+R83/aIlPzaYvNhkJzd/8ruwZhStT0HOK072szZD82WUvY1OpAaiQz7x5AGP3Y40hk62oNnoy8gpweG7sgNgZ4w4RTcCuGZojWF14pkaHPYvvBCQy40d7imzX/T81+mdMOAHMG3F7GbjrCxKQEV5fCMe03vBnVHziImzmAmvHjN6QChZaQsKI2U2klvg9QEBUNZ96g+ATiSaSDe08IvHpc/ghX4DiQpPdmETAYjbi4tU2hfs0MdMt9qb7sKzGjAYrJS9Wh5asDlbfro7bnRk0HCr8zwinEauvDtZ0O9Bd70JkYUvHKxsoH7z2O00ZgywLMEO15rKw0h9NhJEoSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BmDqOJLGiHZjRpQspFvh13Sfh6jqO+E0CpUg8ZMd0GA=;
 b=S3cj3oajgaALP04Onchj+YoaHyTryJAH+Ig0ueXjo2AvHtmwWU7Eu+7yuh6opm9iopSLRdWVGtB93YBNLGQVgQu/Uf2gUHxdBdhVa60HCW7u/FKd8dElExwb3ErAxDafQw8DQubZwENRhgqmwuDGdnSYLf4ty+SRoMP2MazP80iohEicW8koxU2Kw1lRyhAhfGXeeQVhUzQkM0hmZ2xwpncn/S7cALDnv6uiw4kbtW+EyN2XPgXkyy7FJJBBnx3y9O9nCdOMjLNDBpbig4OQPprG5AAn3MmZc5T4/Y80TSz92Q0HYF4+u14qVQ7X4GKiQ/RCH7AdW2BlZIZ8EDrlMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BmDqOJLGiHZjRpQspFvh13Sfh6jqO+E0CpUg8ZMd0GA=;
 b=GG4kG9Xt/KUuO84ajA4HfuL0GmhkH0GtwmzhpGsSvIiqUFMuqI8VDbGBV+ntDneYmBKdd947OVnSuZfHwCw28vrwx2rMNFSIWokqiTnoT7wmWo79YlLlrFiUtBFUjvs1mPeL221Em0XSLmu9sDte8X9++5FTbB3VCAjrXg5CB7x9/3mxPwDBLkTE2RgesFltXwhSrrDldC901i8s8XF10uGippEjzmYqFXs9rrVrZ3aePqzuEHsErEWidQtTfGYyxuhNz1wclKPtQ2nXzmkdyWrA8ksboj6KbfM7AvLyLLUnXNhGWCUqox6QzSZyqe5rVa8ktDDzkYeElBzO+RGLFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6001.namprd12.prod.outlook.com (2603:10b6:208:37d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 04:28:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 04:28:33 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 13:28:29 +0900
Message-Id: <DECDZ26UD1EM.1FAMFTZCAVBAF@nvidia.com>
Cc: "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 11/11] gpu: nova-core: add PIO support for loading
 firmware images
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-12-ttabi@nvidia.com>
In-Reply-To: <20251114233045.2512853-12-ttabi@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0143.jpnprd01.prod.outlook.com
 (2603:1096:604:25c::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: bb6c70fd-465c-4888-056f-08de27241930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b25xanBEQ3Q4ajBFU09EdGZ0VzRMcDNrK2tMOTlOK3NsazhtZ0Q3MnFBeUVi?=
 =?utf-8?B?VTdZNGcxTTVIcCtNWVBLZHdhRElHV3RWMTFwNXd6eFRFa29ZY1pBZEFBOU1R?=
 =?utf-8?B?Y0haR2UxTExuQ0VNOVNNTncvcHI1NTVBTW5CN1dpUGt0Y0g4LzRuU3N5amFI?=
 =?utf-8?B?UUwwdW55bE1vdGFZcXhHcFBQWlMrZDFaTTlWMUJFNXIreElmdTk5cWs3NmRG?=
 =?utf-8?B?dlEzZ0JldVAzU0VkRk85akdIcldqZ1drdUNNQkJZYmRNU1lWMUVsdDJnVmta?=
 =?utf-8?B?T2JXYzA2RVY5ckMySWVoeWx2V3BuMEdGb2tPWkM5R1FYNHdYU0Nac1M0cmdo?=
 =?utf-8?B?bkNxOFBJaEhEMkNtUVdmcjdlZi9QSU05aHZxSVhjNVM2Q1ZUazc1RWRoazhr?=
 =?utf-8?B?MjVKTitsMVhzMHpsM0ExNlBBc1JiOGxWRzFRYjc5MmJTQ1QyWVEyeU81Q2JG?=
 =?utf-8?B?TWo5cFJaMDEvUGJpLy9JSGZvWmxQbVpuclErOG9OdnNta2xVZTkxZEtRbVJz?=
 =?utf-8?B?WVZwcTJtQTVCUlY3SG12dVlsbDZzQTBFMFZUekZRZmxEMzFpUENPRS9nSHg2?=
 =?utf-8?B?bkQwTkluck5CMmNQeGprbzZwUHk0UG41TXA2dVNBWjdtWXRUUW5acGxUMDJ6?=
 =?utf-8?B?OEQwaGZTZEcvQ28wMHFHR2FLb2UrK2VLMk1mcEM3OTN2b1dyclVyUktzMXF5?=
 =?utf-8?B?a2ZpZitnNkFiNnBKWGF4WkRNY1FJWGluVGdvNHprUmx2bmlEczhCZU1wZ084?=
 =?utf-8?B?VTloZUtxcXZ6bGVZSlRHNzFkWkV3ZXlZTVlvRTlkRStyUTFsZU5IeldsZ1R6?=
 =?utf-8?B?cDVGcVo3dVM2d0lCQVpjR0hncUoxOHM3VkkzUlZpcVp4MGVLZkpUMC9pNXBM?=
 =?utf-8?B?N2VUUFdXTE5wbDVrQUJ3SGVhWEVPc3Q1VTMxdEZiZXBRWVorYXAreVdidmtI?=
 =?utf-8?B?eXdld01uSTFsSDdOZXdicmVoTEo2TnhZWjJDaEk5WHVSZE5tbEt0bkRMbkpG?=
 =?utf-8?B?NVRmR1BHZ2dRQURTTG1QQk1sUE1iYklIbS9JWGJ1MEErSlJzekdsMnh5eHZG?=
 =?utf-8?B?NFdKU0NrdlJCZWJoYlN2eW9HRXlHM0FXMWM4cHp4S0YzRnFTNlA3RUhPa1NJ?=
 =?utf-8?B?OGdJdjc5QmhyUUhUeVp2WnkwSU5jQ05Rcm9qZDRObjI5aUUyVWRzMTVqL3Rr?=
 =?utf-8?B?TDVnL1loOWkxN2srYWRnUVRyTFA2SjE4REQzS0JmS3MrcGx2WUFLOG1jaTdp?=
 =?utf-8?B?NU9aWU96TkFjWEVYSHRKMWIzMXNkMy9HOURJYjR3bUhsaGNkdVVMSUJ2SlpZ?=
 =?utf-8?B?WFJXTHphL05GcEVOWTVibGJGWm1VU0VzWTAzNUQ2TkpKWGRYVTh6WlR4cHV2?=
 =?utf-8?B?VDA1cnZNU2hRRFlLbTU5bEhUTlVYeHppSGx0NDFUQXEyNjloQ21rN0tzOXdF?=
 =?utf-8?B?MjJGQllYMXRGbkZyRDZuL1lVbEpMajVQZnlYT2gzODBENkRNTktHSnhPdU0y?=
 =?utf-8?B?S1VKTzhoMjgxV2NDSlFWVERiamRtbTFxSFMraU5XdVkxYlczTDlyeHE2WWNi?=
 =?utf-8?B?TGNJZkhkYityRk9lbk1rdGJ1UFNRYkRYTjY0VEMwYTViTm5YUE5kOXJjSkx6?=
 =?utf-8?B?QnpCbHRDK2Q5RFFTbExxWm5QRHRXMnYzY1RMTVU5QnZvRklaQUpiYTcxYjFz?=
 =?utf-8?B?S3JkT2pSZnUra0JaOGhDVWVhb0VDWkFOSTk1YWRsYXdzQUJXYzA3UzlSZWNB?=
 =?utf-8?B?aUpiUHgyUStwRG1NOUtHQmVJM3NpQ0NXVVFkYkxVZ3lNQTA3VUtqQmowQVhD?=
 =?utf-8?B?a2NXTWlqR0tvenJBYXJXSHpKNTRyS0prQ3hlbkZTNE90alp2WTF3Ti9zUElF?=
 =?utf-8?B?U2tzdGIrNExKY2JZTlhaWTlZUXIrYjBnYzRjZ3NEbjl5dkxrS25EVk50RTha?=
 =?utf-8?Q?DqtGA/Iqd3G6FJ9ikGr0Tyid/TRlhf6q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L281SzBGTDFGTi9ScGMrOHNBODNybTZJOWNxcGpCckxTOTZWVndyWlBoNFc5?=
 =?utf-8?B?MFpLYW9rSVMvZ1BnUWpEUjNBSGgrVE9GelNhRENMaW1wcTg1N3B4WGtPcDNs?=
 =?utf-8?B?YStGN2NFSi93K1RYWjF1QzEzdEtOMzFjNE9MeUhJbjdwc0UrSlAvVnBLejJz?=
 =?utf-8?B?b0JsWEREc3R4YnVOTVB4YkFwRUE1aDhnUUlZNU5RNVAvNnM0VkJSbWpiYzRo?=
 =?utf-8?B?dm8zTVJqS3NYTXZHSnRNTytrTjJsbGdqNFNuUG1CZU80RFhtRWhOR25IN3Nj?=
 =?utf-8?B?Zmo3ZCttZmV0NldUbktyZmNTUktmMERwb1VoaHJTQ1BLMnREeWsyWnZoaXNW?=
 =?utf-8?B?R0NlYTBlZU9uYUZ6czZKOElHUVpYT29GUVhHdWUxWDhRdkg5U09xY0wzMjJI?=
 =?utf-8?B?K2RYeGY2VHNGSC93K3ViaGF0ZzBKRWJUVWZFUHQvYXZuY01Kc0tpUGpORHdS?=
 =?utf-8?B?K0wyQWVRRmF2WHRIWmZvSDRkcC9BdjAyM2ZLSTd0TDZ1SlNMeExOVzJRVWoz?=
 =?utf-8?B?NnJZWmZBY2xQcjFQMXNOWVNOb3J2VGlsOEprKzBIOWthaWRJZjhJK0E2VFB0?=
 =?utf-8?B?K0JUeXRualFFM0wrRS9xUkRVWjFHT0hqeXdaSm5Iekw5dU0xRWZZYUttN3VG?=
 =?utf-8?B?K3JVblhkZm1BSmFVQ3F4dmY3K08rdXNPTFdSYnJGM2JyekZaenZQZlhzNXhr?=
 =?utf-8?B?dFZFclBVMVptTWp3aVdjUml3MkNCZTFDSFlVR2dvTisxNkRRY1lRM3pOK0xN?=
 =?utf-8?B?cE1XeFRmYkwvVUZady9wRlJyVUNQakJiVlFTeE1ScEpUTHdQblp6dVVVaUZY?=
 =?utf-8?B?MUZtWlhLc2NVOXpxVHFoNkc5T050bHUwajA0QlJNTzAzNS8xcVVIb2FRczlo?=
 =?utf-8?B?S2txREdPdE44VWdjK3JSSFlyRmVSL0lOM2QwZTdaaVZ6M0JLeGFYNHNGa1hO?=
 =?utf-8?B?ckNVKzhGMmQ1V2tFOWpnWU5MbnBWVWxPUUk2YkZPeisyUHpaeVZ3V2xDV0Jz?=
 =?utf-8?B?S01uQ1Fzb3hGZHZUbXR1RXpxUHJYSmhFYnZQSEpHb3BKdk9ZNitVVXRpMHNB?=
 =?utf-8?B?YncvZTRNRVFjeHpSUk1oU3U4aEcvMEtnUk9GcjE2YnNGdFU1VVNVOFFpWmsv?=
 =?utf-8?B?WmVqanI4OWVScHlqbHhEcDdSQWt3M0xSdVQ2YVVFWnBQNTVzMWFxbFhKOFZL?=
 =?utf-8?B?b3llR0NDOFBWejlHSFNmTUdJS0xUVTJheVFEaXY2NkNNaExROTJZVXJ0TlE3?=
 =?utf-8?B?Y0NkSHBRUEhwZTEvaTg5U2FFZmxTNTVtOGRPenM3dTlydTR4Z256UkRDYkly?=
 =?utf-8?B?U3dycm81UmYvaU5pQmJ4TDZQWW5CdXAwUjVyMWhyUXBCWXA0WEZDY2l2MGtN?=
 =?utf-8?B?cXJVYmhPZGNibEw0UUlnNjFsN2IwWU9obGJlVW1yK0t0VTBtMEtFVG1FQzBE?=
 =?utf-8?B?SUM3MkN3bG5LaDBFa21MbmM0YnBkdXFTcVFYSGk0SkVhNGRqT1dMcUR1UUZa?=
 =?utf-8?B?djk0T0ErTGlhd29Camh0UjFRV2Q2T1FqNlk5alRxNEZKZm82Z2tuZHNYNDFn?=
 =?utf-8?B?WnMvdUJzTktxeXlKK0NWanhLVHBLYUlDZHNzQ0ZIL2RHQktsRHBxL0NyQkZq?=
 =?utf-8?B?TG9ZdEplcnB3V1hkRzJwUkJBZ3libTRhTHBGRmhDSFlhNExTNmVwaTJvWC82?=
 =?utf-8?B?dmpnOGpZck9RYThqajMxZFVzbEx3SzlyOU9oK1FGR3Y5S28vTmFIejhySlVD?=
 =?utf-8?B?MW15YlFYK253aWFDcWdCM0VzanhSTlloUms3YVJzRUdBS1V4VjRqUVRSRk82?=
 =?utf-8?B?R095d3B4bTdkRXBzWCtUUWg5RUgwS2RpbmV3M0d5T3pqdmR2ZVM1b1RpVzI4?=
 =?utf-8?B?MnFWRzdoTVhxTHRPdXlvbnNHd25xc2RvTzZ1ckdsanFRbTZ3N0F5c3VmUk9X?=
 =?utf-8?B?V05LVDVyYXJvdFJQYWh2RU9zMTBtQUhRZEgvZmgrSUN2YjVZd2NNRHExcmdJ?=
 =?utf-8?B?K3BBb1VTRWZ5dVRFaHJTOSt4QlRJSkRPKytydjI5QmNZZHBlbEJMQ0NRb05a?=
 =?utf-8?B?V3YvUHhjYTd6M1BTTTNuSEVUSkEyR3p4bCtEQWNRSzVkbUhETFluNXlad2NO?=
 =?utf-8?B?N1NQc0tpUnBRczVNd1ROeWdyTDlMVllsaDF1bFhLTllsem5XUU1jVlVtNjIv?=
 =?utf-8?Q?6y5Ub8/piu6k9ZqiXC7O1OFL/cfHZWCTBfpgwPMd26Ow?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb6c70fd-465c-4888-056f-08de27241930
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 04:28:33.0276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/8eFIWRqei0RAU7LJrsksA2mcXXHQXgdgBH0tDtOrzUSzmk8LgGaIE9pJrQ97EVt+1c5WHJb2S/ejEHVcAvPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6001
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
> Turing and GA100 use programmed I/O (PIO) instead of DMA to upload
> firmware images into Falcon memory.
>
> A new firmware called the Generic Bootloader (as opposed to the
> GSP Bootloader) is used to upload FWSEC.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs         | 181 ++++++++++++++++++++++++
>  drivers/gpu/nova-core/firmware.rs       |   4 +-
>  drivers/gpu/nova-core/firmware/fwsec.rs | 112 ++++++++++++++-
>  drivers/gpu/nova-core/gsp/boot.rs       |  10 +-
>  4 files changed, 299 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falc=
on.rs
> index 7af32f65ba5f..f9a4a35b7569 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -20,6 +20,10 @@
>  use crate::{
>      dma::DmaObject,
>      driver::Bar0,
> +    firmware::fwsec::{
> +        BootloaderDmemDescV2,
> +        GenericBootloader, //
> +    },
>      gpu::Chipset,
>      num::{
>          FromSafeCast,
> @@ -400,6 +404,183 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
>          Ok(())
>      }
> =20
> +
> +    /// See nvkm_falcon_pio_wr - takes a byte array instead of a FalconF=
irmware
> +    fn pio_wr_bytes(
> +        &self,
> +        bar: &Bar0,
> +        source: *const u8,
> +        mem_base: u16,
> +        length: usize,

We will definitely want to combine `source` and `length` into a
convenient `&[u8]`. Now I understand why you used a pointer here,
because we need to write an instance of `BootloaderDmemDescV2`, and also
because we use data from a `CoherentAllocation`.

The first one is easy to fix: `BootloaderDmemDescV2` is just a bunch of
integers, so you can implement `AsBytes` on it and get a nice slice of
bytes exactly as we want.

> +        target_mem: FalconMem,
> +        port: u8,
> +        tag: u16
> +    ) -> Result {
> +        // To avoid unnecessary complication in the write loop, make sur=
e the buffer
> +        // length is aligned.  It always is, which is why an assertion i=
s okay.
> +        assert!((length % 4) =3D=3D 0);

Let's return an error instead of panicking here.

> +
> +        // From now on, we treat the data as an array of u32
> +
> +        let length =3D length / 4;
> +        let mut remaining_len: usize =3D length;
> +        let mut img_offset: usize =3D 0;
> +        let mut tag =3D tag;
> +
> +        // Get data as a slice of u32s
> +        let img =3D unsafe {
> +            core::slice::from_raw_parts(source as *const u32, length)
> +        };
> +
> +        match target_mem {
> +            FalconMem::ImemSec | FalconMem::ImemNs =3D> {
> +                regs::NV_PFALCON_FALCON_IMEMC::default()
> +                    .set_secure(target_mem =3D=3D FalconMem::ImemSec)
> +                    .set_aincw(true)
> +                    .set_offs(mem_base)
> +                    .write(bar, &E::ID, port as usize);
> +            },
> +            FalconMem::Dmem =3D> {
> +                // gm200_flcn_pio_dmem_wr_init

Probably a stray development-time comment.

> +                regs::NV_PFALCON_FALCON_DMEMC::default()
> +                    .set_aincw(true)
> +                    .set_offs(mem_base)
> +                    .write(bar, &E::ID, port as usize);
> +            },
> +        }
> +
> +        while remaining_len > 0 {
> +            let xfer_len =3D core::cmp::min(remaining_len, 256 / 4); // =
pio->max =3D 256
> +
> +            // Perform the PIO write for the next 256 bytes.  Each tag r=
epresents
> +            // a 256-byte block in IMEM/DMEM.
> +            let mut len =3D xfer_len;
> +
> +            match target_mem {
> +                FalconMem::ImemSec | FalconMem::ImemNs =3D> {
> +                    regs::NV_PFALCON_FALCON_IMEMT::default()
> +                        .set_tag(tag)
> +                        .write(bar, &E::ID, port as usize);
> +
> +                    while len > 0 {
> +                        regs::NV_PFALCON_FALCON_IMEMD::default()
> +                            .set_data(img[img_offset])
> +                            .write(bar, &E::ID, port as usize);
> +                        img_offset +=3D 1;
> +                        len -=3D 1;
> +                    };
> +
> +                    tag +=3D 1;
> +                },
> +                FalconMem::Dmem =3D> {
> +                    // tag is ignored for DMEM
> +                    while len > 0 {
> +                        regs::NV_PFALCON_FALCON_DMEMD::default()
> +                            .set_data(img[img_offset])
> +                            .write(bar, &E::ID, port as usize);
> +                        img_offset +=3D 1;
> +                        len -=3D 1;
> +                    };
> +                },
> +            }
> +
> +            remaining_len -=3D xfer_len;
> +        }

Let's turn this C-style loop into something more Rustey.

We want to divide the input twice: once in 256 bytes block to write the
Imem tag if needed, and then again in blocks of `u32`. Nova being
little-endian, we can assume that ordering. This lets us leverage
`chunks` and `from_bytes`.

I got the following (untested) code, which assumes `source` is the
`&[u8]` we want to write:

    // Length of an IMEM tag in bytes.
    const IMEM_TAG_LEN: usize =3D 256;

    for chunk in source.chunks(IMEM_TAG_LEN) {
        // Convert our chunk of bytes into an array of u32s.
        //
        // This can never fail as the sizes match, but propagate the error
        // to avoid an `unsafe` statement.
        let chunk =3D <[u32; IMEM_TAG_LEN / size_of::<u32>()]>::from_bytes(=
chunk)?;

        match target_mem {
            FalconMem::Imem { .. } =3D> {
                regs::NV_PFALCON_FALCON_IMEMT::default().set_tag(tag).write=
(
                    bar,
                    &E::ID,
                    port as usize,
                );
                tag +=3D 1;

                for &data in chunk {
                    regs::NV_PFALCON_FALCON_IMEMD::default()
                        .set_data(data)
                        .write(bar, &E::ID, port as usize);
                }
            }
            FalconMem::Dmem =3D> {
                for &data in chunk {
                    regs::NV_PFALCON_FALCON_DMEMD::default()
                        .set_data(data)
                        .write(bar, &E::ID, port as usize);
                }
            }
        }
    }

The cool thing is that this removes all the mutable variables and
counters, with the exception of `tag`. It is also shorter and more
explicit about the intent IMHO.

> +
> +        Ok(())
> +    }
> +
> +    /// See nvkm_falcon_pio_wr

This doc isn't really helpful - why is this method needed at all?

It appears to be because we pass the firmware data as a
`CoherentAllocation`, which PIO loading can not work with directly since
it bitbangs the data to load instead of using DMA.

But `pio_wr` is only ever called from `pio_load`, so `pio_load` could
call the `as_slice` method of `CoherentAllocation` to obtain a slice and
work with `pio_wr_bytes` directly, removing the need for this method.

> +    fn pio_wr<F: FalconFirmware<Target =3D E>>(
> +        &self,
> +        bar: &Bar0,
> +        fw: &F,
> +        target_mem: FalconMem,
> +        load_offsets: &FalconLoadTarget,
> +        port: u8,
> +        tag: u16,
> +    ) -> Result {
> +        // FIXME: There's probably a better way to create a pointer to i=
nside the firmware
> +        // Maybe CoherentAllocation needs to implement a method for that=
.
> +        let start =3D unsafe { fw.start_ptr().add(load_offsets.src_start=
 as usize) };

Yes, `as_slice` will give you a slice that you can pass directly to the
updated `pio_wr_bytes`:

    let fw_bytes =3D unsafe { fw.as_slice(0, fw.size())? };

> +        self.pio_wr_bytes(bar, start,
> +            load_offsets.dst_start as u16,
> +            load_offsets.len as usize, target_mem, port, tag)
> +    }
> +
> +    /// Perform a PIO copy into `IMEM` and `DMEM` of `fw`, and prepare t=
he falcon to run it.
> +    pub(crate) fn pio_load<F: FalconFirmware<Target =3D E>>(
> +        &self,
> +        bar: &Bar0,
> +        fw: &F,
> +        gbl: Option<&GenericBootloader>
> +    ) -> Result {
> +        let imem_sec =3D fw.imem_sec_load_params();
> +        let imem_ns =3D fw.imem_ns_load_params().unwrap();

Let's return an error in this case instead of panicking.

> +        let dmem =3D fw.dmem_load_params();
> +
> +        regs::NV_PFALCON_FBIF_CTL::read(bar, &E::ID)
> +            .set_allow_phys_no_ctx(true)
> +            .write(bar, &E::ID);
> +
> +        regs::NV_PFALCON_FALCON_DMACTL::default()
> +            .write(bar, &E::ID);
> +
> +        // If the Generic Bootloader was passed, then use it to boot FRT=
S
> +        if let Some(gbl) =3D  gbl {
> +            let load_params =3D FalconLoadTarget {
> +                src_start: 0,
> +                dst_start: 0x10000 - gbl.desc.code_size,
> +                len: gbl.desc.code_size,
> +            };
> +            self.pio_wr_bytes(bar, gbl.ucode.as_ptr(),
> +                load_params.dst_start as u16, load_params.len as usize,
> +                FalconMem::ImemNs, 0, gbl.desc.start_tag as u16)?;
> +
> +            // This structure tells the generic bootloader where to find=
 the FWSEC
> +            // image.
> +            let dmem_desc =3D BootloaderDmemDescV2 {
> +                reserved: [0; 4],
> +                signature: [0; 4],
> +                ctx_dma: 4, // FALCON_DMAIDX_PHYS_SYS_NCOH
> +                code_dma_base: fw.dma_handle(),
> +                non_sec_code_off: imem_ns.dst_start,
> +                non_sec_code_size: imem_ns.len,
> +                sec_code_off: imem_sec.dst_start,
> +                sec_code_size: imem_sec.len,
> +                code_entry_point: 0,
> +                data_dma_base: fw.dma_handle() + dmem.src_start as u64,
> +                data_size: dmem.len,
> +                argc: 0,
> +                argv: 0,
> +            };
> +
> +            regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 4, |v| {
> +                v.set_target(FalconFbifTarget::CoherentSysmem)
> +                    .set_mem_type(FalconFbifMemType::Physical)
> +            });
> +
> +            self.pio_wr_bytes(bar, &dmem_desc as *const _ as *const u8, =
0,
> +                core::mem::size_of::<BootloaderDmemDescV2>(),
> +                FalconMem::Dmem, 0, 0)?;

Once you have `AsBytes` implemented on BootloaderDmemDescV2, you can
just do

    self.pio_wr_bytes(bar, dmem_desc.as_bytes(), 0, FalconMem::Dmem, 0, 0)?=
;

> +        } else {
> +            self.pio_wr(bar, fw, FalconMem::ImemNs, &imem_ns, 0,
> +                u16::try_from(imem_ns.dst_start >> 8)?)?;
> +            self.pio_wr(bar, fw, FalconMem::ImemSec, &imem_sec, 0,
> +                u16::try_from(imem_sec.dst_start >> 8)?)?;
> +            self.pio_wr(bar, fw, FalconMem::Dmem, &dmem, 0, 0)?;
> +        }
> +
> +
> +        self.hal.program_brom(self, bar, &fw.brom_params())?;
> +        // Set `BootVec` to start of non-secure code.
> +        regs::NV_PFALCON_FALCON_BOOTVEC::default()
> +            .set_value(fw.boot_addr())
> +            .write(bar, &E::ID);
> +
> +        Ok(())
> +    }
> +
>      /// Perform a DMA write according to `load_offsets` from `dma_handle=
` into the falcon's
>      /// `target_mem`.
>      ///
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index 5ca5bf1fb610..ecab16af0166 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -31,7 +31,7 @@
>  pub(crate) const FIRMWARE_VERSION: &str =3D "570.144";
> =20
>  /// Requests the GPU firmware `name` suitable for `chipset`, with versio=
n `ver`.
> -fn request_firmware(
> +pub(crate) fn request_firmware(

This isn't needed, `request_firmware` is only ever called from child
modules, which can access the private members of their parents.

>      dev: &device::Device,
>      chipset: gpu::Chipset,
>      name: &str,
> @@ -252,7 +252,7 @@ fn no_patch_signature(self) -> FirmwareDmaObject<F, S=
igned> {
>  /// Header common to most firmware files.
>  #[repr(C)]
>  #[derive(Debug, Clone)]
> -struct BinHdr {
> +pub(crate) struct BinHdr {

Same here.


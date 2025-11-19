Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E1CC6D221
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 08:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B960F10E594;
	Wed, 19 Nov 2025 07:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ifepcjty";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012035.outbound.protection.outlook.com [52.101.43.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6772110E594;
 Wed, 19 Nov 2025 07:33:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OH6DYjWtVjpCNGd1xJkUwdHl1AjR1ZBlwDgA6mqpLqMAPT379fW0svbvVP1srjrimiCiv4sX/VNzjyqcYsskrDERANyzTnPGELx/Vzs8KCeq2MBps355815Wu6a8vnG3PIku5dXAQmp5eLMcOfPP3qOpyUciqAMIcjqM3tohKfUCKSGFLlJhme27sAZPQMQGtOqWRUkTQyB7hMFOodH5uo6pO8KTGeVjL0Ic1DcxLOHWh72xyDkls+b6twpmbKTCni7/c69PoN1vBl+klvntIhKBu8tBkcwD3KkKEdsGD5WaiD9xhlJETVla0h7tBD6rtfqLfOyEz4B0awRRzzZO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LgCwrOC3dCP3d9swVffrFqqeQ3XsPuixnt5Z5Qtt9e4=;
 b=pjq0m83SUnLewM8WZgFJWs687Jja/YHj18+9SvBfsps//NS3LfWYCrCnKuvDh3P57KyXfWKg3mW3TiDxxbqFchiZA+ZCibY5tbrEPBt30Eqah1LahYYPnCuaJ3kwg9P9bKr2+9SRrwKxP9bcYOKjfYxZG1qg03aGRxvvyICyOriBf+5iYHKE6MbbHEaAk0UPd1EPQI5x0XE8qPFr0IREzhSQt0j5e4gcBSNZPm50zjfyt7rqXg2keXp3G7DlULNXY3bpMddVMBflBqBrKV/qXUAQiKWqX9ZzSDa4qoMCNIixdFNVWrEVEWtMXdirR1aqQNsAQYf5mq4V1RK0/TYHCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LgCwrOC3dCP3d9swVffrFqqeQ3XsPuixnt5Z5Qtt9e4=;
 b=IfepcjtyKaRAyxKn5M41uU9gkVfnvU9XS+9jfHorA67dUTwjMBCI5peHJ5jrlVyyqCnC0s9FmNg6a+c1jKAaVsBhLZ3H6Cv9XyaFQnfvnp5iX3UuJPNOS1T8valhxfFgvkIgOjPv7N/5g3CWZ1cVc8gKD8+ya3kE52q7TwirpX3J4SX4OYj76HZVjrzvQ2DiR2x2R5636dxlXXo/5MSxxkRxnVnfjA1yU/vdqrqxYfaKI01S1RBZ4+Rvk/EbafWPyhP6Bk2nJNyvf7H97KQjLJPcUxrXLjH3wznGRLLTPqXS9Oga6wxWPZH/rev1FDnCVwAaaWeF9pRJa+xuLA3RUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8854.namprd12.prod.outlook.com (2603:10b6:930:b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 07:33:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 07:33:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 16:33:01 +0900
Message-Id: <DECHWCRE819D.QVXCHPH23WTK@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 1/6] gpu: nova-core: print FB sizes, along with ranges
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251106035435.619949-1-jhubbard@nvidia.com>
 <20251106035435.619949-2-jhubbard@nvidia.com>
In-Reply-To: <20251106035435.619949-2-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0044.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8854:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c5c319b-9fa8-463f-c445-08de273de0cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1hwdDh0UVdxcURwbllnd1JhcXFXczQycTRIRXpaV3NBakdkS1lKYW5yNlQ0?=
 =?utf-8?B?ckZuVEsvcVBWYi9ScUVJMGtDaG1HSFFwKzJ6UCttQytsL0pXc2FwZTdGL3o2?=
 =?utf-8?B?U1hHWElsN0RLVjBaTSs4WXZGa09jNXM0VWp1QURtTnhjbTdERzVjQ3AxTmxY?=
 =?utf-8?B?U3FlMk5HVHhkTTFydVB1aGFicVV2aDdRWGg5Z1ZicGkwcjl0VVVVZk5Wb1lC?=
 =?utf-8?B?SmFITDNJRThPK0ZoRXMwWDhzMW1RRFgvSmVKcXRqTUtWVzBXWnpFekhhSzJm?=
 =?utf-8?B?WDJwWjRydTNmL3pHZGw4QVpiL3BtcE44Y1VZVmx2RWhYd3hIckl0S21XRnNL?=
 =?utf-8?B?Z00wektCaHBON1pyTXZPWVg2NjBURW1KYkVsVEZyOXl0Vk94SjczeE9keDhH?=
 =?utf-8?B?MUJlbU1YdHpGMVpvWHc0WnhCdmtEQk5FenljelE4bWE3ZCtML05GM3VZNVpv?=
 =?utf-8?B?N0pzUHAwZkprU2t2eTJmUnRpTUVGLzZ0dGNwbktWTmVndUF2b1JYSS9BVlVV?=
 =?utf-8?B?b2ZmNzlPMFlDK3Q1dWJlMkhsRThwMmZ4Y0FUSDhNTTZab29PSUJMWUVZdzJI?=
 =?utf-8?B?Z3p6bHFVSE9ta000OU52dEJuLytwQ1l3elAwU1NCVDgvNmFPOUpCWndydWF3?=
 =?utf-8?B?SVMyNnRid0lXOG9IakpuSit6YlZTWVFjMGtpenBUdXhMbEhQK1BjdU43dU5I?=
 =?utf-8?B?R1FJTUsvczJzRHpKaTBLMGFaTnpUY3luOVh3Z1QzQzBlbGFRWnlvMGdYdFcw?=
 =?utf-8?B?dnBIZnZNa3c2S2tiZnM5STg0b3FpY0U2Z2JYVUEwYXJmdVRkVm1oSm44QWYw?=
 =?utf-8?B?YUxvOXNCT3JqSWtyem5POUtDL1R2QnhhcDJZTXE2NzIzclNTaGl6dG9LMDRw?=
 =?utf-8?B?TmYxSGxnWjlVQVVKd05uSXZxaCtCVjNkS0t4UWxKYjl1OEhweHdGT29uQ1ly?=
 =?utf-8?B?UUZBS2xHZjhzQzZta3ZsR0lmUnRUeUVJU1MzRkd1d3BtdTU5VFVCVEk2R1BP?=
 =?utf-8?B?b1Nhd2VqVmRkZzYreG9HTGt6TmtnSVFSZGVTbHhnbG1yZld4TVlhVGpPSzlP?=
 =?utf-8?B?UHp2cCtFUGdHTnBtbnpQT0l5QndXeElxalJka1czNXU1YzIvYmwxU1hxZGdi?=
 =?utf-8?B?bS9KWlhRMTluQmtmdWZxSUJhb3BMeUtIVlpwL05tTFVUUEZkYjZrcjBiUi9V?=
 =?utf-8?B?OTJLN1RHQ2ZlZjVJaWRkUjNBcithdFdGYmhDN0R6Vy90Ty9QVWVLa1REMm9K?=
 =?utf-8?B?TFNrMHpTeXB2ZlhBSHFYWkZjb1ZXTHdmV1VPRjRySGpMMmVOK0tRUWFSNWlr?=
 =?utf-8?B?V1pTdVRyQ1RVTVJ5T3JMZ3dxOXhjOUh6Z3VuWkRiNjlta3ZXQU5KR2lseXVi?=
 =?utf-8?B?dG5vdzFYZ0lLNS95SlJwZmhtS1hUSU5YVjFFM1YvaW85cUZDY3NSNVE5V05U?=
 =?utf-8?B?MFZoczdRQVpSeGxGYXRNcEJwRTY1OWd0amFmRUp1OW8yQ1BEV3RQSThhNTV2?=
 =?utf-8?B?WkhPc3oxdjA3Q1QwaTZ5ZWpNMmhxbFFqL3RSakZpS0pjL0svN05mckRwYjdw?=
 =?utf-8?B?eFBVSlpoNWtydWxGWlYyeE00R2Z4VjdHc3B2L0xQcSt3Rm1ydU9IUWFRWUwx?=
 =?utf-8?B?d3gzUmQzVlFuYk5Zb0p3QUUyMmVFT0luRGdWYzYzNFI3bEZ4R2VFTUNYUEQw?=
 =?utf-8?B?WVY2ZUJueWNRV29yV2t6T21ncFJkeFAzZ1J3N3NoL2hyYjlleFc3eXd2T01D?=
 =?utf-8?B?aGRINlZHdG5WSStSRWF2OG5KN1krOUZkTmMzaEhaa2p1b2hTZU53bWtTVjVm?=
 =?utf-8?B?TU9pVUY1Uyt4RmVWMWdpcno5VUR1ZVZVQnVweHZDZFBVMlVneGdDTkNOVWNW?=
 =?utf-8?B?aCtjZHVsV2F2OTBsdnpwVUxSeXNHcTg1THVlSUt3bGZGNG9PYldUR1h1akZ5?=
 =?utf-8?Q?EDMYqWwPhWA33B02SmLQ66fNlqydY6Ch?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFBCM0xjaU5aenVNTkVjZTlCQnhldVVIdkRsT1BFSk40RTdPdUhuUzNZTERh?=
 =?utf-8?B?VDJBYk83cFNaMkdXT0FRZWdvZTJMdlRLMjZWRXB1UUFWMjIwalJMZ0FXelJl?=
 =?utf-8?B?MnpHYXNuR0pYemxXRzJ2M2xNbUhoZGRXSWx2Z1F4YUZWSlk1a3pKUUNZcUFD?=
 =?utf-8?B?Z3QvUk1vdDR2MWMwbWRnZlNkbHRRVk5lQ1VTOXB3eS9RR0FrTS80VXloL3B5?=
 =?utf-8?B?RFZTTmViVVREclczckloNGk2YUJ3V3dNRDVKNVRReDB6eCtCL0ViWS9seTV6?=
 =?utf-8?B?ODZHT1ZTQVd0UkQ5c0VHbjNWc3U3K21VTVllZXBvTkVWanRwTmx6eTcrK3d5?=
 =?utf-8?B?VHdrSXlIS2dSQndsOVhyUFR0ZEVLK3FLb0hZd0NTVVdDM1lZa0NvNmtXbi8w?=
 =?utf-8?B?ZVZXdDl6WmZjYzBUWVpQaHJMbDJmZFNDY2k4RWVMY3ZWVEtMZGg2SWQ4aVBV?=
 =?utf-8?B?bXNXSE9yVFV0a2E4RkNqMzlPL054bC9qdS9wUnpwdUVFSTJzSEdBNEhZSkxL?=
 =?utf-8?B?SFYyaW9qOVRtaUhaYnlVL1FuaWVocDJaYXQ4cTZEdVlSclFSRTBOdlZXNDJL?=
 =?utf-8?B?azd5SFZieHFQbTA4R3ZvTzBxS2YwbG5teW1STHVkbVp0MS9kclYvVGc2T3ly?=
 =?utf-8?B?cHdBVm9vQnJYeDdzZVB4SDBlS2E0VlhHbytIRGNhRWxiVms5YTkrSjRyUFh5?=
 =?utf-8?B?Wjd2Q1JLbmI2NzZQRmszalZUVnBnNUJmQ3NPZVlGaVo4b3VpYmRsMW8xY0U1?=
 =?utf-8?B?VXBQdVYxb0h0cFhJR3BsemlmNjVpVm9OWGlnMWlVY25kRFQ3TVZEbFQzcldY?=
 =?utf-8?B?K0pSTGxDYVd1QkZEektnSTU4NzByNGRQK0lDNWcyUmd5OEpEZWZ0dTc5NU1p?=
 =?utf-8?B?Si9yUjNNL3puVnZhN25wOTlsWnpzWDRMdks3cWNkU2JsK25vVVJLSEVqdzFB?=
 =?utf-8?B?ajROSVdIZVlKMUd5bDNrU1E4VGx0cmYxZWlDbVNjb2lvZjZWVUVxQ2J0RzIr?=
 =?utf-8?B?aGs0ZFhVQ2lGeGFpejdURU1lU0VvaGFPckUxa2t0aUxaY1lJZTZ3QVRYTlJM?=
 =?utf-8?B?ek91S1dnbXFxTFlKYjNYMHF0dFVnNnluOGZuS3Q3bzhpVmc5MUJNQkVUcUFh?=
 =?utf-8?B?eWVYcmRkWUNGcG4zakVmVlZBMGR5eS9ZNUVDWWRDRU5IU2NsbytlYnJmYXAx?=
 =?utf-8?B?SmdyWks4VTdXRUgzbFVjOWdrQTdWQWQyVUlZS0JmR1FoTjBpRXVaL3cyRDBL?=
 =?utf-8?B?aE54ZmY0a2syL09iUGc4bXZjem45NTE2OTJDNXNFd2JRNDdmcnJrbUV3bkxK?=
 =?utf-8?B?Ukh6NzZxeE12MndUSEIwVS9vSlVoT1V1cDhRMDdJWDFXcm9kZ2pNckFaajZ3?=
 =?utf-8?B?bFNmYU9FMnowVy9LU1AwaFZ3TU14bXZUK3BkczY2TDNjVTVLS2JyeUt6bkJV?=
 =?utf-8?B?aHI1bTdab2dINkhZTlAxTWEranNjMjY0aEVIZUhFZGpPYUxiaFRJaFY5K2p3?=
 =?utf-8?B?RGh2YTFaZU5HQzhJOEpXTUdQR2dUZDMzQ1d5QWdHeTRPd2Rua2VQQUlxRDZR?=
 =?utf-8?B?dVhYL1A3aDBjbUM0RFljWFhYVEdwYi9HTUpCQVozbHBPVjRPbHdNZWNnV2tI?=
 =?utf-8?B?N1FqMzI4STJLaTgrRUZ2REVJZWtySnA0QlpYaExtdTZweGZsTlJtMGszMUN3?=
 =?utf-8?B?RjYwdjZuK1k3NHBhc0x6bU1uaTJrODhhWG5NL3RrZTMyYjQyUU4zZ2VySzJ6?=
 =?utf-8?B?b2pjbzYxUWVCQnhDeVhmUUlVU3A1bVNEMXRWbGRmS3VuaG9HcG5mZlZHanJs?=
 =?utf-8?B?TnV0dStjakxIVGhOUDRwWjlmdzl3UjBGSEZUUVFDM29Bb1ZRRTRpK0NFdGtJ?=
 =?utf-8?B?b3ZVQ1A4L1puSUhPR3I3VVRWdTlORmRvZzdtd0ZPaEtMZlFnR1dqeDFpYUx2?=
 =?utf-8?B?SXlTbTdST2Foc0xnUTY1TzlTeXJBNmZvaGllOSs1Qm5XbXgrUmhsNHlWcmpC?=
 =?utf-8?B?Z0NLRUxkS3JKcXZmdlUrdGN6aThMejNyUnpnZkw2Z3N6RWxvRnhiWS8ranhX?=
 =?utf-8?B?MnlhNGRIUHJsR0RuMUxDY1JMTzFza1BtVWg5RytGSWxjWGtzRHNBV1NwdGo2?=
 =?utf-8?B?SjlsaE95aE1tdGozQ1BoZGpYeFB4U1B3MTYwbDFPMEpCRW8vRCtsMUNWOFZ4?=
 =?utf-8?Q?YISvxhD+qJOVxd4tisHahczIwsZHrpc0IrG3ioh5smNg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c5c319b-9fa8-463f-c445-08de273de0cd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 07:33:05.6542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AMrNScWu+cEZ16s5Rp7Hqetg+dgBpdA+JGOo4n2VNSc2qbTo5c/HgAYLjkudRljTft5vU2SSOR/FDNXXOCddJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8854
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

On Thu Nov 6, 2025 at 12:54 PM JST, John Hubbard wrote:
> For convenience of the reader: now you can directly see the sizes of
> each range. It is suprising just how much this helps.
>
> Sample output:
>
> NovaCore 0000:e1:00.0: FbLayout {
>     fb: 0x0..0x3ff800000 (16376 MB),
>     vga_workspace: 0x3ff700000..0x3ff800000 (1 MB),
>     frts: 0x3ff600000..0x3ff700000 (1 MB),
>     boot: 0x3ff5fa000..0x3ff600000 (0 MB),
>     elf: 0x3fb960000..0x3ff5f9000 (60 MB),
>     wpr2_heap: 0x3f3900000..0x3fb900000 (128 MB),
>     wpr2: 0x3f3800000..0x3ff700000 (191 MB),
>     heap: 0x3f3700000..0x3f3800000 (1 MB),
>     vf_partition_count: 0x0,
>     rsvd_size: 0x1a00000,
> }
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/fb.rs       | 33 ++++++++++++++++++++++++++++++-
>  drivers/gpu/nova-core/gsp/boot.rs |  2 +-
>  2 files changed, 33 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index 10406b6f2e16..004238689f26 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -87,7 +87,6 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
>  /// Layout of the GPU framebuffer memory.
>  ///
>  /// Contains ranges of GPU memory reserved for a given purpose during th=
e GSP boot process.
> -#[derive(Debug)]
>  pub(crate) struct FbLayout {
>      /// Range of the framebuffer. Starts at `0`.
>      pub(crate) fb: Range<u64>,
> @@ -107,6 +106,38 @@ pub(crate) struct FbLayout {
>      pub(crate) vf_partition_count: u8,
>  }
> =20
> +struct RangeWithSize<'a>(&'a Range<u64>);
> +
> +impl core::fmt::Debug for RangeWithSize<'_> {
> +    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result=
 {
> +        if self.0.start =3D=3D 0 && self.0.end =3D=3D 0 {
> +            write!(f, "0x0..0x0")
> +        } else {
> +            let size_mb =3D (self.0.end - self.0.start) >> 20;
> +            write!(f, "{:#x}..{:#x} ({} MB)", self.0.start, self.0.end, =
size_mb)
> +        }
> +    }
> +}
> +
> +impl core::fmt::Debug for FbLayout {
> +    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result=
 {
> +        f.debug_struct("FbLayout")
> +            .field("fb", &RangeWithSize(&self.fb))
> +            .field("vga_workspace", &RangeWithSize(&self.vga_workspace))
> +            .field("frts", &RangeWithSize(&self.frts))
> +            .field("boot", &RangeWithSize(&self.boot))
> +            .field("elf", &RangeWithSize(&self.elf))
> +            .field("wpr2_heap", &RangeWithSize(&self.wpr2_heap))
> +            .field("wpr2", &RangeWithSize(&self.wpr2))
> +            .field("heap", &RangeWithSize(&self.heap))
> +            .field(
> +                "vf_partition_count",
> +                &fmt!("{:#x}", self.vf_partition_count),
> +            )
> +            .finish()
> +    }
> +}

The only concern I have is that if we add fields to `FbLayout` we will
need (and probably forget) to update its `Debug` implementation.

How about we just use this more intrusively:

    pub(crate) struct FbRange(Range<u64>);

    // Convert easily from a regular `Range`.
    impl From<Range<u64>> for FbRange {
        fn from(range: Range<u64>) -> Self {
            Self(range)
        }
    }

    // Provide transparent access to the members of `Range`.
    impl Deref for FbRange {
        type Target =3D Range<u64>;

        fn deref(&self) -> &Self::Target {
            &self.0
        }
    }

    impl Debug for FbRange {
        ...
    }

Then we can change the members of `FbLayout` to `FbRange`, and keep its
derived `Debug` implementation.

The initialization code would only need to marginally change, e.g:

    let fb: FbRange =3D {
        let fb_size =3D hal.vidmem_size(bar);

        (0..fb_size).into()
    };

And with this new type, we can also address one another shortcoming that
was bugging me! In e.g. `boot.rs` we have this ugly bit:

        frts_size: fb_layout.frts.end - fb_layout.frts.start,

What we want is a `len` method, but since our range uses u64, and `len`
returns a `usize`, standard Rust doesn't provide one for us. But thanks
to this dedicated type we can now implement our own! :)

Not saying this has to be done in this patch though, but it's a nice
side-effect.

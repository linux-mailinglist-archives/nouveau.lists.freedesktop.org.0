Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12581C28979
	for <lists+nouveau@lfdr.de>; Sun, 02 Nov 2025 04:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9DD10E18D;
	Sun,  2 Nov 2025 03:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YQebKXkr";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011033.outbound.protection.outlook.com [52.101.52.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4240A10E15A;
 Sun,  2 Nov 2025 03:00:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OhOff9TbWHNg/YjRAr0LxrlR1MSgtzRYjfqwXx/Y9Mh24BqLtNnWWinyOo1NUd+V2000l6b9WvuRBQt98IBowl4s2dUveP6DMrUTmdGmFF0u03WnPWJwWZWHnpq6YbCeDaXPeUpYiZSVAkgGjyob4yRspZlhH2aWl46B6UwJazvu/2RW71/yKos98LTLDrFrfXDVOEyh+Pir9eqeRdXr4H2qPYsjnuHFQvBYY1/7jWKBkqynbx3zXRB3baJCTb4yrgjpATJm2cpEoG6JuD9uEFzLNzPxtrqWykYi0X0JXsy1M72R7bLaxReD8w/hBqf4yzKyfi59242AHa+3r4w4pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXVN12ewAb5GAPuAyyS9dirvGhoP6iO5hk0VFw+0Dl0=;
 b=cZ0Z2RvGE7wfbAZ1X8P69y40N6FIWHL1RRurpfLj3Ui85LZQFaqrgEQTyQdpdSqPPNzUaWmaOepjBsyRqpEKkFKTD+PY7pVosUFrxgO4fodIQ4nBhl62FhNBl2m8NE1mR8W6Too+FvuVc1dP7/ZN8/yixgfgQvIBWyftwf5E+2bZ6IioO4iCGULkX7bdtsg1mpPa1cELCgpLVNoH8Va9t9tDbQVAHpgjcTf6pLgKHDSr5gRhhJNeLkUUfFWRZcUs7pCvOGObBqyQE08mrrDEMDJyJ9rkDRh4pbC/wYdnA+Fvq//CQvIvjTphrn/UmMPxVHK7naAzoz6NHYOIEEvzXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXVN12ewAb5GAPuAyyS9dirvGhoP6iO5hk0VFw+0Dl0=;
 b=YQebKXkrqvK1UXvzeX+FQnQbbOMLxxx9+m7dZt0B6FjGOR3fehWugLd7qmFJ9EfLnZPHG2jShklFM6ObOqXZ1OSZMkHgTAY50ym8w8QY8RNqNzDRp08u2FuSzfbamjpbfHb7T3NC7wF1ulh4NJBER2gFt8q3TBuRRUNDVqlev6ZVzHVXsGs4ZVfSNQE5IecYhWdTAw/m4TSNbL2MUYByWH9vwWseEKQt7/SOzCCt3/X7e2SqJ5cG5xsdWlrdMC5XcyxTTe4IarkwWxlcsHQwd4Eij1IVOfOzViOadBg24ZX4Y0gm/Eh2+beigF8q8oXsv2Aq9l0H1jOBkJYHq0TcBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB9476.namprd12.prod.outlook.com (2603:10b6:8:250::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 03:00:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 03:00:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 02 Nov 2025 12:00:33 +0900
Message-Id: <DDXVGH53P7OW.1UWNG3SM9S0A1@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Dirk Behme" <dirk.behme@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, "Alistair Popple" <apopple@nvidia.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Yury
 Norov" <yury.norov@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Andrea Righi" <arighi@nvidia.com>,
 <nouveau@lists.freedesktop.org>, "Dirk Behme" <dirk.behme@de.bosch.com>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v6 4/5] rust: Move register and bitfield macros out of Nova
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <20251003154748.1687160-5-joelagnelf@nvidia.com>
 <5a5bd549-f5b7-41ec-b493-bda427d1218f@de.bosch.com>
 <DDDQZ8LM2OGP.VSEG03ZE0K04@kernel.org>
 <DDDR8DIW6K4L.21F81P26KM64W@nvidia.com>
 <7dd6c190-2598-4a68-8431-e03e41b276ea@gmail.com>
In-Reply-To: <7dd6c190-2598-4a68-8431-e03e41b276ea@gmail.com>
X-ClientProxiedBy: TY4P286CA0045.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB9476:EE_
X-MS-Office365-Filtering-Correlation-Id: f53dfb75-3469-4644-ddc4-08de19bbff79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXVoanljZHNHYm1xeXdOY0V3a2VyYytjNkRjbDBJL2JKcGZucXptVVNXTmda?=
 =?utf-8?B?Y2dZMStKNHdWK2QvNTRKeG1jYXlCbmFPR3p1TlJFbU5PZ05Sd1hCNk5PbVlV?=
 =?utf-8?B?d3d0RzdCMFpuRk5rQlljYzExNkZObUF1U09qczV6bUtwT2cxeDdUc0k3MGgr?=
 =?utf-8?B?K3o2SENvVXZhUk53OVpjcVJPSkpmSHNydW1Xcm0zOStpbjNFSW1qK0IybUlj?=
 =?utf-8?B?NDVRRUMwSlBpcXM0Sk1PRDhCbGlMc0U0a3M1bXJFRUNKd2E4LzNLUEtQVnRm?=
 =?utf-8?B?Uit3UFBhd3gzY3BqNEJNWEo0OG9vYThEYjkvcG5EaTVnaEllbU5kMnNKU2dZ?=
 =?utf-8?B?QjdVZjd1VldkeEtzMXhuVzk1RHl4Y1liZUtKMFFLT0pVTmVEUkZ0Rkc3djh4?=
 =?utf-8?B?eWFCUFA1TDZuM2Z4U0poK2RFakpLMHlIazc5dXR3K3pPVTNxS3RlN2dWTzk3?=
 =?utf-8?B?WWtaYUhNc1JFaE02V2xDQWRnUkt6S1hHalBiaHAwejBmNUtFY2RNUEZpUmRB?=
 =?utf-8?B?c2dvTHhYN20zcDdJTmpVbnR2aHpIWHpZekY2bjh1YzFNdk1nSFVPKytFeGpI?=
 =?utf-8?B?Rk1tMjRmTUt5Yk1GdHJZYmdwKzZTNE5GSTBkSjFuVmRKdG52eS9VWHB3WTFq?=
 =?utf-8?B?NGNBZ1p2bXcyYll3MWp2Z2hIMjZ1VXIyVTdHQ3JKU291R1p6WVAyRFd0c1ho?=
 =?utf-8?B?aGs0MTZWdDRTaHVYQmRrTi8xS08welhiYnhLVG5hUjdMQ09TUFdaWkorK3B4?=
 =?utf-8?B?YlNTajR6eStlMkJoSTVGZnp2MzVUS2dnNWZPd0dQaytEVmNUdHVaTW1ORjE2?=
 =?utf-8?B?VTdWYlc5VnlkT1kzdTY3d1I3a2JhOTBiRU9UVld5dkYvdHdpTC80ak9qL01v?=
 =?utf-8?B?R2E0cWdGd2JSWjA1RWtjeTNFZTdXUTJiVXJ3VUhoUDdJcUNBTWZLVkZHTkg3?=
 =?utf-8?B?UXVnR0lYYXFGS2lFc2lYVDBMWU00Z1dyTHpxVFp3ajVOTFpIeHl0L1l4TTVl?=
 =?utf-8?B?MWxWblk4RU44N0RhUGJzUk42S0dSL1lJUlZyK3FYMnlHYUpUSjY1eUpOLzRu?=
 =?utf-8?B?eXFHc1hMNVJBKzZqTE8rSUJINDNhQWJmZU41WTNFaVBGMGNtZVNtTjVlV0hP?=
 =?utf-8?B?L3lMSzNqcG9zU0JWVkY4V2luT1FvSHVoRTh5eHd5UGRhY3poaUxidFlnUk9F?=
 =?utf-8?B?UGI3dzdZSU9FalhITE9xTWZRaVdqdU91cFBsM1RQeVhIeG02RWwrZy84NnNO?=
 =?utf-8?B?VnlyQVl5SjVMRFNmeDhlUERTSkE5T0hyY2t3UldPb3IrTUJ1V3ZCK2hNdVE0?=
 =?utf-8?B?bEpWTjZLRGNBci82dldVWnozSWdHSmFkS0JEaGNOczNrTU9zRHpzcFk3ZzV1?=
 =?utf-8?B?Z29wUTA5a3ZsQkp0Tzk0UXZXOVZEQTcyTzRXREMrOHFabC9panlaWVBPU2U3?=
 =?utf-8?B?bE9LQXRlcDEvT3RiN1p4dEZSRk42TmVZYnM2YnRTRFR0YlJEWWgyRzVxUm82?=
 =?utf-8?B?UXNCZXU5ZTRuK0ZiYlU3c2ZwSm5ZQUhoVlN3b09KcTZoQjkzRnNsSklMMjlu?=
 =?utf-8?B?S0tpNituampEOTRtRUxtS3N2MXgzaDJFdmRsQVBOdlRJSDRYcGhBRm9vd2pZ?=
 =?utf-8?B?MDdRZ3dvcUNBZ1RPMjNET2kwcC94U3U4NlhVRGFiR1dPZ2pnYlFsNVJIVWJa?=
 =?utf-8?B?aUJVdU15Vlppb1U4bWRnZWNvNUQ3cmFPREl3U2dac1pVVnVBMWhXeEtuMlY4?=
 =?utf-8?B?ditNNWRZd2hYUFF4OWN4RHVHamFLaW41cThscHZOTnJoVFNNdUExOEFsTk1l?=
 =?utf-8?B?UGtIM1Q1WndhK3MwZG5ONFVrc2tPL0VpZkRUZ3BQaEdlelVzKzVKeWYrajRr?=
 =?utf-8?B?SlgyQlBISHJickQ4c05xbFVZMElkRkhrdElFbWVEbUszbGlkMW11VFVGVFBJ?=
 =?utf-8?Q?ZnE+owbcqrPdy+v8eH7i/7P/Td2Io4En?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU5ORmhzSWQ2eXdONkV6TnJPY2tleXJ4VnlsR0VLb2djWVN2YUlDOVBSMGha?=
 =?utf-8?B?Tkx3b1dXdENEZk1wb0loWVpmWWFCbkt0WlFoMGZwMitmMzdsUlZ2bFlyOXRj?=
 =?utf-8?B?WVdxVEhpYXN0L24yZUpMeTlvait6cjZpOVVKQk1LM3JBQmZDMnBxdGFVVHpK?=
 =?utf-8?B?U2RUVVNBZ0kzMVhNR0JZK21XYVVSKzFNbmV1bnBRQk5qeTJDKzNiT2N2cjEw?=
 =?utf-8?B?QW42N0p4dWN2cHFJZ3JXK3BZbkFPVEZpSGczRE53dVh0UzRWQ28zL2s1NGNE?=
 =?utf-8?B?TVM0UllWa1EyeS9sR1JJNi9WK1JhaUtSSWN1SUo3MVBJK1lhSnJBaUhRVVdw?=
 =?utf-8?B?NDYvaGlDaHJrVXVqR1ZETGFsQS9DNnBpR0dQSkNUOHJBL2NxbDJPMTlORzVF?=
 =?utf-8?B?NVpEdm5Hb0pGQStVbitsUXZDVmcrTkx2WDRhbGcyTFJGYVdPemF0SzcydjdT?=
 =?utf-8?B?K1NqS0U1clU2UUR1dW1tNDh6NWtPN2tqS2ZSSXB1ajJ0UGdkUWxJNnVxT1BB?=
 =?utf-8?B?ZDJDczVZdFZKSVFJTnJ3d2duOG55ZHJzbys4eStKSmtadE9CcGo5Q1B0amJE?=
 =?utf-8?B?Vk5sMW5CQkVMc3JvUm94RitYWnN2c2tlbmFmU0pvUWJxcHV4dlovYnVJRGtK?=
 =?utf-8?B?S1BvajkwdUVLV3RESzFibEttNjZIdjhLeFdIMlphUkFuV2xvWUUzTjYzZmhj?=
 =?utf-8?B?MTQzRG9GMFo0Z2VJMWk1WDArdnFtMzZjOVg2MU40eFNDdE53KzlqYUVaL2po?=
 =?utf-8?B?Q0l4aFd1L0doS3pjblBmUzhRQmlmYm9IZEY1RGNYYWx1dkNENE9lYjFsbHRJ?=
 =?utf-8?B?eWZwNU1xWGcxM0JwV2FtbmkzT3ZCK1NuL1ROUmRvSFVOMlp0UVlpaWU0RUNL?=
 =?utf-8?B?RjlxSmQvck1ETHhLQ1ZVTHFVRHZJRmxLekFNRnFkRklQV0dvSDJIbGhBQXRI?=
 =?utf-8?B?MkR0aFdmNE1GZzl3YzFRREtBenNIcVRWMjBMWDgwN0E4bThxMzBZSzlNRlZz?=
 =?utf-8?B?REUvRUFFNWJybzZUcWxwSGRCZ3N3T0dWcjc1bHhFZXo0NkVEN1RFaWQ5QVND?=
 =?utf-8?B?azFQTFh6TnV6ZXY2b2lhUnd0QVBrVEYrWm9FN1dEMHFYaE5qSFRxMUpkbm9J?=
 =?utf-8?B?N2VjYkhYRFA3TGE5akkwNitDMjNzU055Q2xhaXY3UWNXM1FkdUhFWk0yVm1k?=
 =?utf-8?B?UFB5MFpuVHB2MlFWWE40eHl2TkhERnl5d01vNEhzZG1OajZwN29Qd2I3bEww?=
 =?utf-8?B?M0RoTGxXY1kyZ3czOE9EMWlzOURLZ2o5M21uK0psdXE4cEw1WXh1SEYwdTN4?=
 =?utf-8?B?R1ZFY295eHVsUnVweVFRR2dzMnNnMXZsQWRaaGFTbTFFRU50M3o2ZERqeDNX?=
 =?utf-8?B?RWFUUGsrc0s5ZGVVTE0yQ2NMenl3c0szdThwUkp5VFc1UUdOdGZnWEowc2li?=
 =?utf-8?B?a2lyL3BrZTVod1R1MjRTT0hmYlJvZXkwTzVVRVZxZXo1QzgzQlhGTE10S011?=
 =?utf-8?B?bHE2ZHZSbDBlODl4MS8vQnhlaXgySHVaOVJZamdodFdWUCsvVEtGQm9GbWMr?=
 =?utf-8?B?RHVmdVo5UEVTZjJxZmdsRlBLOU5JRngrS1RPcjZDcGdWeUlZdDRpekplRVho?=
 =?utf-8?B?aXJrb0NtbkZzdnlwekFTWnBSMkpmaUxNSHJqTytSd0J1bmFweW40NGpHQWJt?=
 =?utf-8?B?dHllcnhRdW1xcFJIVjhNbFVLT3JLcDh0M01URk85VmlkeXBHcHJyYis5Vjc1?=
 =?utf-8?B?ckg3d2RZZ1QxSmtJSjYzVVpuVjhoUjUxUWpWQnlaWXBFcytnbndoV0kxd0xO?=
 =?utf-8?B?dmZvZ05ZZ1NnMWxwMy8xKzh6Sk10cU5HWUFYL2MveUpVb2hsYk9RL2FtNlV5?=
 =?utf-8?B?SExoT3UzWmt6eStDaStvQlc4UVVJMHFiL1hJaXFPQkRBQUt5UFVORzhiMURs?=
 =?utf-8?B?SzZLeTR6Q0dKNzYrVXQrWVdUMFBHZkNMOVZxc0lyaHM0TXZlOVRjU3V3RGtC?=
 =?utf-8?B?a0l2U2E4dUlPWTYwMmdzWGZvUlFjQThVSnRTSFUwSGdDeXBoMjhxZUZhQlJ5?=
 =?utf-8?B?M21qTjVpZDlUV1NKZUoxYkpFd1JkcEVETXBvUDRFSDVWZzFXbkwxdDcyNTRu?=
 =?utf-8?B?K3RVNlJ5RUlxSTFJdTV5OU9jdS9Vc3k1OThKZzFuQkEzNnBXcnFROGV4b2ZT?=
 =?utf-8?Q?7gQKxxJlUpTiT0uQ9Shm9P+DoiEBafj/Ao5+zUzmv53z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f53dfb75-3469-4644-ddc4-08de19bbff79
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 03:00:37.1003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ayH3KxVjirYFekxGhUrCq2XnVDjwbRf5tcFI2FZN2SlRJi5lw+RsxpdVekDlPA7E1xW2tG5VvAm5amMBN13iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9476
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

On Sun Nov 2, 2025 at 3:51 AM JST, Dirk Behme wrote:
> On 09.10.25 13:28, Alexandre Courbot wrote:
>> On Thu Oct 9, 2025 at 8:16 PM JST, Danilo Krummrich wrote:
>>> On Thu Oct 9, 2025 at 8:59 AM CEST, Dirk Behme wrote:
>>>> Assuming that register.rs is supposed to become the "generic" way to=20
>>>> access hardware registers I started to have a look to it. Some weeks=20
>>>> back testing interrupts I used some quite simple timer with 4 register=
s=20
>>>> [1]. Now, thinking about converting it to register!() I have three=20
>>>> understanding / usage questions:
>>>>
>>>> * At the moment register!() is for 32-bit registers, only? So it can't=
=20
>>>> be used for my example having 8-bit and 16-bit registers as well?
>>>
>>> Yes, currently the register!() macro always generates a 32-bit register=
 type
>>> (mainly because nova-core did not need anything else). However, this wi=
ll of
>>> course be generalized (which should be pretty straight forward).
>>>
>>> Having a brief look at the TMU datasheet it looks like you should be ab=
le to
>>> treat TSTR and TCR as 32-bit registers without any issues for testing t=
he
>>> register!() macro today. I.e. you can just define it as:
>>>
>>> 	register!(TSTR @ 0x04, "Timer Start Register" {
>>> 	    2:2    str2 as bool, "Specifies whether TCNT2 is operated or stopp=
ed.";
>>> 	    1:1    str1 as bool, "Specifies whether TCNT1 is operated or stopp=
ed.";
>>> 	    0:0    str0 as bool, "Specifies whether TCNT0 is operated or stopp=
ed.";
>>> 	});
>>>
>>> Same for TCR.
>>=20
>> Patch 2 of this series actually adds support for 16 and 8 bit register
>> storage.
>
> Hmm, how to use that with the register!() macro? I mean patch 2 adds
> support for different storage widths for *bitfields*. But looking at
> patch 4 [2] it looks like *register!()* still uses $name(u32)? With
> that it looks like that the register!() macro still just supports 32
> bit registers? Or what have I missed?
>
> What I'm looking for is a way to specify if a register is 8, 16 or 32
> bit. Using the example from above something like
>
> register!(TSTR<u8> @ ....

Errr indeed, you are correct. The `register` macro's syntax has not been
updated to take advantage of `bitfield`'s storage types, and `u32` is
still hardcoded as of this series.

This looks like an oversight - a register is basically a bitfield with
some I/O, so making it support storage types should be trivial. I guess
this hasn't been done yet because Nova is the only user so far, and we
don't need/want to explicitly specify a type for each register since
they are invariably `u32`.

But it wouldn't look good to change the syntax of `register` after
moving it out, so I agree this should take place before the move. The
same applies to the visiblity feature.

One way to avoid a update all the declarations so far would be to give
Nova its own `register` macro that invokes the one in `kernel` with
the relevant parameters hardcoded.

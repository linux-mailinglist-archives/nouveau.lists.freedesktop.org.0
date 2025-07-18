Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2DAB09EC9
	for <lists+nouveau@lfdr.de>; Fri, 18 Jul 2025 11:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1929310E138;
	Fri, 18 Jul 2025 09:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZP5zW8v0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2075.outbound.protection.outlook.com [40.107.236.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D9610E138
 for <nouveau@lists.freedesktop.org>; Fri, 18 Jul 2025 09:13:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rl8hNKW2KgPTz4NaYpOvNesUM6kFSFWop+hB1QsCCgH7T5huqhYw/hHoHXPfXqVjAIAVNoclLYvo6ubdpk3Z+oWWooiPrr/7On6dL9G3fvDhxrw5DcIE2LlrPG3o6UlqIOhbeJ0zh6Hf5lXmk/dJMnG/tTmpVDuqg2e6kt+N/zaInRc4G/7+r/643N7X1BgI56xlFJxRkxilbyVj14Hu6cpq0WBlDnFJTp6SO6T6RgIKW0bs2g+kSOY8ZR4kdqeKQkUzGWX6V//doqwtRGhWAIGG/CqGOwAjhzGtaFPGZigQSi+4KG/QjMqJcVLvPLQta2ypwdWw6AU16uM2wGOs4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9pVMVxDrQxb3dd2xsT0Y39HcVwRhJ1Yhq6EJzge7zk=;
 b=BtFMVEj38xe3j8cVDIEix2So8zK7r6Jx/un8L861auqfCMWAkc6i4tJ/MVFWCWLSNYL6hccazC54jKW/Jbk6ZfP8Kvwp9sz1HLmPfVRzaeiRqT0YdnuFjY5fv//giss4s5Ioxi8QRY6J2HnW6tgtoBjbiCRxD9xglhwDw85xuRfLY8TN9ASWIx24fPwpcE9YmrZapOClFcxoRwhkzLX2HPlX67RkatufoZoEuot+CyrAhMP73z02owbZAnyFb5WrZZtV1d8eBzrwZyixaWqAN0OcPUaJdrw76nHqHaAvRVDP39r43N8ThgY2GDWZHVwk+LaiVgdBOmMy5Lze4WauJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9pVMVxDrQxb3dd2xsT0Y39HcVwRhJ1Yhq6EJzge7zk=;
 b=ZP5zW8v0MTXIIbxTdwf7uJ9SkOgn0g3QfHvB5aFn3moeSNQkIt00DLfHoYjyMxhIOeEUhG2pJFP7rZ8scc0t1yD6KPMVHxV/kxiaoc2bcrF9MNtqOatACs0fM/mOzmdVcMTy2Uu6fZJXl1/eb7BBTFa4H+4eP9nJSSRdLfiamsrUjQMlgm9O/Tuoa1RJfHjxWYa++TuIoIxJ2rM2V+JXhgxAbemz0hL9CJETd1mOrFg817kKgyppfDU5lipr57a0KoZpdGvL/+wjmIMhSDdWjoL/sIuifRuVKgA6AMv4XLxOhPwHjlghidCySd3AyPFySBkRnTSG92TMYzUXPvLK7w==
Received: from MW4PR04CA0219.namprd04.prod.outlook.com (2603:10b6:303:87::14)
 by CYXPR12MB9386.namprd12.prod.outlook.com (2603:10b6:930:de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 09:13:09 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::14) by MW4PR04CA0219.outlook.office365.com
 (2603:10b6:303:87::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Fri,
 18 Jul 2025 09:13:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 09:13:09 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 18 Jul
 2025 02:12:56 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 18 Jul 2025 02:12:55 -0700
Received: from inno-thin-client (10.127.8.11) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 18 Jul 2025 02:12:54 -0700
Date: Fri, 18 Jul 2025 12:12:53 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Ben
 Skeggs" <bskeggs@nvidia.com>
Subject: Re: [PATCH] drm/nouveau: remove unused memory target test
Message-ID: <20250718121247.1c468638.zhiw@nvidia.com>
In-Reply-To: <6b65fd5f25f3a8d91222025cb0a6bbadf7e8604a.camel@nvidia.com>
References: <20250715210559.1188776-1-ttabi@nvidia.com>
 <20250715210559.1188776-2-ttabi@nvidia.com>
 <20250717110924.3bd285ea.zhiw@nvidia.com>
 <6b65fd5f25f3a8d91222025cb0a6bbadf7e8604a.camel@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|CYXPR12MB9386:EE_
X-MS-Office365-Filtering-Correlation-Id: b7a9a15c-c679-4ebd-65fe-08ddc5db505a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1ExS1pSVENSVnp6OFBPR3N5WWFkYnpSWm9ISzFQSzRmYjVNd0oxaHpSWGJ3?=
 =?utf-8?B?bE9adERweFhidnI0TS9lcE5KbmVNL0JiaVg3UWJDNW9BU0tCQWVwbmsvZzNt?=
 =?utf-8?B?SHNsMVdJd0k4ejFWSFgrZ201RjFXZFljeWRHakhzYzcyL0lmSTNHbldyVDl4?=
 =?utf-8?B?L0hveVBlRzdPOWFBbmFiblNjOThVbHR2ellDSENOZjBCZFhXWkVrc05GK09X?=
 =?utf-8?B?NWNqOVlnWXBPam5sRTZoQ2pJcWRTMDZ4QTBBakJUMk5OL3N3QVBVSnNUY3dP?=
 =?utf-8?B?UjUxcTR2di94azI5cmwwK25vL0RScjNnbDNBQ2JpNVNnYU9FTWs4T0pxU2p1?=
 =?utf-8?B?WnE1ckhvQVVuU1pwaCtQM1Z6Tk9RNmNXMkRHT1h6anJyZGJ0YVVWczJjWGZE?=
 =?utf-8?B?OTdNaG5WVWIrSkZGVlFYWGVUaWhlVk1yWC8xN21hWlQyTTRBSkE4VHZ3My95?=
 =?utf-8?B?TFR3T21jVmcxZDZ4c2t3MmZMRnNwRkFxdTJWZU5ObC9jMFVaTmY3TjFkM2VH?=
 =?utf-8?B?ZzQveW5CWXI0ZjQ2R09MK2hPMGZWN2ZRck91MXVvM0JPWDhobExOMDMxUHlC?=
 =?utf-8?B?R0tjSDhScm9Xa05odkMrdVdmelVrR1BRYzlkbGxVaTZ0OSs5OW1FVjRQOTdT?=
 =?utf-8?B?Vkh5YlJ1dG41MEtTamJBTXE5d0x6RDVSNlpPSSs0K09VS01UM1VPbFBUcFFu?=
 =?utf-8?B?Tk9tWmx4VXFhL3M1dmZqaEducHo2RklRdU5RMFNOQlVqeHNJelBIdXViUmFt?=
 =?utf-8?B?YlJTRmFRMllJQms4dE9GRUdyRHVkVzNBcTZDVVRLbVBpRWV1K2JLRXFVSVNi?=
 =?utf-8?B?WVNRZHVxQU5tV1k1NkhjdFlrZEFPeUJGT21HTldKNnJtQU45SDRhYlR1ZWN1?=
 =?utf-8?B?ZWQ1UWFZeE5CcHF5UkVOenE0b0hTMVF0czZnSzFVMW00RmltUWFyaGRjcFJQ?=
 =?utf-8?B?eGhLVnVjTzdkN3E0VTdSZW5jVnNsQ0JSN1NLbDl0bTg5V0xQRDFhRUdrNk52?=
 =?utf-8?B?czExNmlCcGN0aklvUk1nYmRPSHRFRkU4S3V4K0VUaVhFc2t4YTRxaFdGOW0y?=
 =?utf-8?B?UCtyRXl2aU52MnNiRlVUSWJ4dC9WNTlXSVlwdnFHVVQxdTcvTGJyTWRwbnlu?=
 =?utf-8?B?QWoydVRUSUtQSFJpbnltNkYwNlJ5RUdKSzdnK1NMQndBcVRjZEVveHhXblFS?=
 =?utf-8?B?eEJBS3BVeExsRzc1TTkydFZvMzNhZU5ZcFFPZ1NuV0Y4emNsNHY3Ri94Vkw3?=
 =?utf-8?B?ZWNWcW5DeG0rOEhZdE8rNEhGOTFscW9tWGM1YXlOOXR1TzZiQVl6cEpxNm55?=
 =?utf-8?B?SlVwa0U5ZVREcW5lTmJpM2hlUENHOGpHMjNrVjRUcHpoNDZpK3ZOc3VkMzZU?=
 =?utf-8?B?czhRSEFaWUFBMW1HdVVtbUN2WlNYbmdmSTJpQTN4djUwUWNTUW9yUlpBc0s2?=
 =?utf-8?B?bEd1aS9vZnBxZEY3RHRHa0JMdU1YN09uTWE4NHhsNXpYVWJaelY0R3pYZmJF?=
 =?utf-8?B?SHRZTHFVSGZTMXV2YWlsY3Y4UndxNWpqNzVDZE9CWVFwSnlubTZHeVNGM3VT?=
 =?utf-8?B?WVhMY21MREVxZ3IzZVlCT0xYbjBOUzAybTZESVBjUlQ3VEp3WnZuMDgzaVU3?=
 =?utf-8?B?M3RyTmJUV1drOU0vTnp2Z1M3TUsrbFZxVlhmUXROMGJQMzlrbWFxb2FqYnRL?=
 =?utf-8?B?cExrdDIvSzkzV3ZrQnREUGl3K2JLWndmbk13Tjh4dE5HVjlBc1krdk1ycCtG?=
 =?utf-8?B?bU8vdGxkak1uZWFuNVd0YnRCRkxTczkzVFowZFpXUEFRWUhjUE4wWmdzNnRM?=
 =?utf-8?B?ZWVibHU3TkNldWFDYXlpQWF3alI3NkVuQ3NWZ2hpK09vRDRVNis0d0RReE9j?=
 =?utf-8?B?blZJK0tDZFovbzRWQ0pMN3czdjFPYWNFSHNjc0dOdWhXa1haVCtuZkxzYVNZ?=
 =?utf-8?B?OXpVZU9Bc25MWkN1Tm11eXBnVGJUendtQUdmblhJeFV5TGdnOXRrSG5IaVVy?=
 =?utf-8?B?L1pab2pBQW1xSVQybDlWMGM1VmtrS3BDQ2FWd1NqUnpOaUJ0ZHRQcmZnWXd6?=
 =?utf-8?Q?5WiS58?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 09:13:09.2864 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a9a15c-c679-4ebd-65fe-08ddc5db505a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9386
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

On Thu, 17 Jul 2025 15:06:24 +0000
Timur Tabi <ttabi@nvidia.com> wrote:

Oh, you are right. LGTM then.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> On Thu, 2025-07-17 at 11:09 +0300, Zhi Wang wrote:
> > On Tue, 15 Jul 2025 16:05:59 -0500
> > Timur Tabi <ttabi@nvidia.com> wrote:
> >=20
> > There is also a similar code block in this function:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (fw->inst) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 nvkm_falcon_mask(falcon, 0x048, 0x00000001,
> > 0x00000001);
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 switch (nvkm_memory_target(fw->inst)) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 case NVKM_MEM_TARGET_VRAM: target =3D 0; break;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 case NVKM_MEM_TARGET_HOST: target =3D 2; break;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 case NVKM_MEM_TARGET_NCOH: target =3D 3; break;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 default:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_=
ON(1);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n -EINVAL;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> > Should this be removed with the same purpose here?
>=20
> No, 'target' is actually used in this block.  That's why I moved that
> variable to inside the block.
>=20
> 	falcon->func->bind_inst(falcon, target,
> nvkm_memory_addr(fw->inst));
>=20


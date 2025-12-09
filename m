Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0953CB0494
	for <lists+nouveau@lfdr.de>; Tue, 09 Dec 2025 15:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5912D10E62F;
	Tue,  9 Dec 2025 14:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CkTWTrsR";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012071.outbound.protection.outlook.com [52.101.53.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885A910E62F
 for <nouveau@lists.freedesktop.org>; Tue,  9 Dec 2025 14:29:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPkNsugdQCAdv5ei2IbJadjWwvQFaYsPhz28UAw8PTwr82UY1BZYjPhbeQA0CJMU9+COtGnxiFXmBWqlOU604dhYKDQdw89XrNui69WrS4L/3ZXL1skR8ssGZ4sRSBdIgjqLVoMiGOPeNom7PwaRD8MuTuFUymF8xBvpTLDjb3flQqmbnkkAKqyUf8B0OQX1NC3fUZ7yP+fnKdwVZHWV+1E5Bhm7zbwcuNXdKA3W4Lc7e7eTwOoAu4XN9fVZuQHwi/w+L8ls9r5+Ue57xmUvyM746j+6vA6XlkaiaKoHfDRCeG4PzX39ZdaSumrrfaYRuwT4rjijqNp3S0BVwq7qQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lb+qqanzNhVZL1mSY4OKmFOHZ3bi9xP/28e5MRBummM=;
 b=j0hXd26j57G7WL+75klGeXkC2kYwjHGvP4i0hYWmmTQpLVmrihdrNP/2Y8SF6xiddc8reTAcjIq2M2Hc/a/XXdnqqDwPG7JJyVhCsM/E/Sr+NLNpX2QJRf6NeBHiA0MuItSGs+xRW6VnSAlNfRgFftr1uSOBcCgmHu4O7gkbtPhBpF5iBYljdI9EXyE6B9YLhs+JFKaxfHtFg9XjI0KI7Ba8uDR3DydIQZ5PQ/76dW1PLBRpZfBqk/+ashfc4IuJOnoDmd0ytmGC9OCJLNqGmVgGPPifGnl5TRjLAQKyJfnpZsN/gxlOnop6tUpT4pPAWmeiAe9UokXBtNsZ24A5ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lb+qqanzNhVZL1mSY4OKmFOHZ3bi9xP/28e5MRBummM=;
 b=CkTWTrsRn6lvdljdOlZ9/2v4PdgIH4WHhvkvMOMU9M7CFFjlZ1xeR50G5c6RT4fbJU15RTox9RJ99zjQVuka3C5tjiUVIsxG39Yx/3eZ2z1qz1VSlNy5hZRl+k7/a9qEKKSCAfLlVbyt4s/1xfxoy5PgeVHl6i50U87QLFWaA+vqH2qEygMvylVWr1Tv9rzwoXQw0KNvrJgXyfqS1SktpqWJ8cM1B61naIC7afUYYCBssBhU3w/lFSoE5ndTD8PxmtEZUvUAPe96UlbE4uVeJGaE/efi07LF5AIRrwymwxSxr0eaIlQJINZjbDNIm5lbk06co3QxrAh1NrE6JuL31g==
Received: from PH7P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::35)
 by CYXPR12MB9318.namprd12.prod.outlook.com (2603:10b6:930:de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 14:29:11 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:510:33a:cafe::a8) by PH7P222CA0008.outlook.office365.com
 (2603:10b6:510:33a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Tue, 9
 Dec 2025 14:29:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 14:29:11 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 06:28:52 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 06:28:52 -0800
Received: from inno-ThinkPad-X280 (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 06:28:44 -0800
Date: Tue, 9 Dec 2025 16:28:39 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
CC: Timur Tabi <ttabi@nvidia.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "markus.probst@posteo.de"
 <markus.probst@posteo.de>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "Neo Jia" <cjia@nvidia.com>, "ojeda@kernel.org" <ojeda@kernel.org>, Aniket
 Agashe <aniketa@nvidia.com>, "tmgross@umich.edu" <tmgross@umich.edu>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "helgaas@kernel.org"
 <helgaas@kernel.org>, "lossin@kernel.org" <lossin@kernel.org>,
 "alex@shazbot.org" <alex@shazbot.org>, Surath Mitra <smitra@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, Ankit Agrawal <ankita@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 "zhiwang@kernel.org" <zhiwang@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>, "bhelgaas@google.com"
 <bhelgaas@google.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [RFC 5/7] gpu: nova-core: set RMSetSriovMode when NVIDIA vGPU
 is enabled
Message-ID: <20251209162839.51e2cf0e@inno-ThinkPad-X280>
In-Reply-To: <26FAD9BC-9CFC-4BFE-9985-DD660BCD840A@nvidia.com>
References: <20251206124208.305963-1-zhiw@nvidia.com>
 <20251206124208.305963-6-zhiw@nvidia.com>
 <6c2e13d934c11170edba603fb88e8f2d67a2a049.camel@nvidia.com>
 <26FAD9BC-9CFC-4BFE-9985-DD660BCD840A@nvidia.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|CYXPR12MB9318:EE_
X-MS-Office365-Filtering-Correlation-Id: e9e1dcd8-e3a8-488f-b228-08de372f51ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|7416014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0pjQTZJWDQrVXFGSFJjaTFYZ0dqdHNvcDVmb3BFOWVtcGhaYnFXNFA1SlUx?=
 =?utf-8?B?K3VrdXoxazB6RDhjMkJvYndPZnZyMEtwakdDekJvaUNUNFU2UGxUUElPWVJr?=
 =?utf-8?B?V2FUNjN5dGNVSklkVFhTLzJmQzEyWk1lVVhUZHZrcFJ4VUM3Z1JUWVdSYlZ3?=
 =?utf-8?B?RWJyVi84dzExbDlwL1Ixci83SXNxQWRHVDZtbWlIMUZDN2Q3dk1tSHZFOVlT?=
 =?utf-8?B?OEFNNW1meUw3V1Bqc1VXYU9uenF4NkFuQlB3WG80alpBbTIwQ3hWS3JvTVk3?=
 =?utf-8?B?OGo5WTN6UUlRSVpNeStJZTA0YVR3Rk82a0tZMVE4d1V3VWsrSzNUcmNXdTVF?=
 =?utf-8?B?OS8yR1NwNGlha1hDLzk4QjFkSUhUblFKbnArV0Nvd3JsR3pYNDhJRzdaMXM3?=
 =?utf-8?B?NFlvR3pyMVpCNWFYb3l1c3JFMGwzNzFVUDJtWTMyVkFlc3lRc3dQYk9OK281?=
 =?utf-8?B?SDV2VGxMSWVjNzNLck9tTlBlTURKcGRrelVITy9PdmgwTHEvcUVTWDV1Y0lQ?=
 =?utf-8?B?NU95WmZRVTc2bmcweHZ4cmRacENSU3FrOWFBYWhieWlpTm1ZaHgvVHpVRFR4?=
 =?utf-8?B?Mk9uMys2UDNJUk9Dc0ZuTmhBQkU5dVlJd3owSHUyNjlhN1ZaMnN5c1hxSjc3?=
 =?utf-8?B?dFFEZ1RWQ1d5MmpaSm0rV1E4Q3g5RFBWS3owTkVnMnB1TUxaRExrTWtOWnAz?=
 =?utf-8?B?Y2RwSFl2SDdTdTlyMDhQaWY4ZWJrWWdWWVhxM2lLdm9JVEV6bTdxZ1RPTEJC?=
 =?utf-8?B?SVV6R3EvUjkwWGpnWU94c05nZTNsYlNLa0JpVE1UOHFlQi9zQk8xUWtMaW4w?=
 =?utf-8?B?WmxJR2ZFV2JtK0RZNnFOak9lKzlGRlZNQXJ0MWlVSndoUTBqZ1J3NnhRQVFN?=
 =?utf-8?B?amhFNXZ3cmVjS1JQOXE1Vzluc3Z1VUhIbDlmaThWNG9aTVpMSHFkQ21hRnp0?=
 =?utf-8?B?QU1rdW1PeURSVElKT0RucnRnYzFrSjdJeHUzbnZrZTU1QlNES01qcHR1M29V?=
 =?utf-8?B?MHZyYWJveTYyd0tISXdpS1Z2eFRVdldEazc0ZDdXR3VRMWwxS256MHBnb1lk?=
 =?utf-8?B?NlBWbURYczdUREI2SlZCWEp6eEVvRVlxTXJSRnJ3WXBSVTJESUgxU2pLS3Q5?=
 =?utf-8?B?Z0JJZDVhVmF0b2RYeXVPN2NxZEsyZzB1WFVOZmhxYk5sQ0YrTzh2Nmx1Y09D?=
 =?utf-8?B?OWdyVzdWQkZqak8vSFJwKzBzZDk3cHVhSXc1LzQrT2ZOMk9OM3NrQW5xSVRp?=
 =?utf-8?B?bUY0aWg3SXNFcmtKYWhJS25Id2toWDNUbUdJdHFXV25qZTl6RFJ6Q3dxVU9Q?=
 =?utf-8?B?c1dtMFY5QUF1ZGtFMEx3ZDYzTkVuK2orTWhDQXBQUXlRMTlCR0tSSEp4OVZG?=
 =?utf-8?B?ZmtYYVIvVWVSL0xDRHAzSjRIeG5TampoZnBIZGFsQU5DZGdGRW5udllEQzN6?=
 =?utf-8?B?RXgxdUNON05Ha1ZsMlRibHk5T1dDT29id1V1RzFWS1IyVkZvM0ptenB5Z0U5?=
 =?utf-8?B?a3RVYWNkdnlQNHBxamtSblVINVFaOVQyUFhOMUg0dFZLTlFNdG8rblZPM2ZG?=
 =?utf-8?B?L2hDMHI4NGJmMFh2N1BKMGVpNlBaYytaTmJYc2hGRXcvWFFIR1JpWURxZFhm?=
 =?utf-8?B?YkZuK3dCNGFFdS84L1NGSWVEeUtyN2JQaXVSOUtvZDFSWEZQZ2ttWjZBczhF?=
 =?utf-8?B?VnVKVzlHMXVjWWJQQXZpdmhtYmo2YU9sL1ZqL2cvYlBIRURYalpMTTJOc3Ri?=
 =?utf-8?B?Q1NDWU9lY1FEODBzSmhWeXVHQTRSaFA3ek1SMVpXZlF6TEJJV1dQY1F1TkxW?=
 =?utf-8?B?NGJTdTNZMzFkM2wvOHp3YmJoblNEdHE5aTVQVy9iQmJQRG9IaVNxU3Z5Vis1?=
 =?utf-8?B?eklvckErVHc1RkpNU1l5bllGU2ZFUEtMd2JuMy9WNTZuaFl4REhrbWFaa2E3?=
 =?utf-8?B?MTN0cW1ab3pzWW0xRVVVSmFuQzdkdzZQcWo2YkFsT3FBendDSktrWmk0a1ZS?=
 =?utf-8?B?VTJBb0pQaGZQaWJYQ1JSRklPREJ5aDZMcjJRbUVGVVVVS0pESzUrWCtWeUdw?=
 =?utf-8?B?SnpVN2dFYTRJMnRnOTFvUkhRbCtobkw3MW0rUVFZQ3RWTGZjMTd4MzBuUDdP?=
 =?utf-8?Q?SUKY=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(7416014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 14:29:11.0816 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e1dcd8-e3a8-488f-b228-08de372f51ff
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9318
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

On Sun, 7 Dec 2025 16:57:01 +0000
Joel Fernandes <joelagnelf@nvidia.com> wrote:

>=20
>=20
> > On Dec 7, 2025, at 10:55=E2=80=AFAM, Timur Tabi <ttabi@nvidia.com> wrot=
e:
> >=20
> >> On Sat, 2025-12-06 at 12:42 +0000, Zhi Wang wrote:
> >> -    pub(crate) fn new() -> Self {
> >> +    pub(crate) fn new(vgpu_support: bool) -> Self {
> >> +        let num_entries =3D if vgpu_support { 4 } else { 3 };
> >=20
> > Instead of passing a bool, and then hard-coding the length based on
> > that bool (which would require that RMSetSriovMode always be the
> > last entry in the array), you need to do what Nouveau does: if VGPU
> > is enabled, then dynamically append the entry to the array.
>=20
> Yeah, I agree with Timur.=20
>=20

Hey Timur and Joe:

Let me see how this could be solved dynamically. Probably need more
changes on other items as well.

Apart from this, I felt that we might need a struct GspBootConfig to
pass around the GSP booting path, while writing these patches. As we
already had coming items, like reserved memory size when vGPU is
enabled or not, vGPU enabled switch, also reserved memory size on
Hopper/Blackwell in John's patch.

It seems we need a central object to host these tuning for GSP booting
up.=20

Z.

> Thanks.
>=20
>=20


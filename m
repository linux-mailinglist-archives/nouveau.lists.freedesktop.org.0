Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDC0C50863
	for <lists+nouveau@lfdr.de>; Wed, 12 Nov 2025 05:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E220310E68C;
	Wed, 12 Nov 2025 04:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cIztJ3sq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011020.outbound.protection.outlook.com [52.101.62.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5773010E68A
 for <nouveau@lists.freedesktop.org>; Wed, 12 Nov 2025 04:30:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTRjOJetrpWOJmvJuqzbu//zOz0aCy2FmsShb4dJXAgbm6RgO4DM+/pTvT8oJT29SwyhhcWBVbMebhKYrwsmtw8Dc44StJXS+xEStDaTmsq4pOnBsvugwLl0QDsmUJcthDzM277GYN6a0B15cw5VGphqySsmsYN+JyGklVAdF+2Sy8JMLYdMS74B9RERjqnDh1CejFMoqJursN5udV/FkBlDiE5lT8k4iOiauthHwW5Zmqsy14lUlvmyVTLJYhm/kD5W8fcHxrtxsivkhch8Ga5q7danl+gOMi+2ge6GErJRVy3/I5Au18rWzoOPZdXcWJFOK16N8cC55uVVKiwfFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGA3QKoC5GGO0PMfYPKtHLk7Feu5YJ20Q0la1CLP8t4=;
 b=Oypv2+QZ+/jMyRi3oERRcpxYp/N8ZZW7VtM7k+We2mFmk+s/9aRy1h/ipQuX3WMAwI8ET67OrEVKNbG2r8wh9GdmNtj2FpzdrszcTlT0AsP5l5/W2jlmzGxO67NVjao3WtQHZMd5jK0mNCCH+UuA1bf1q/0aP+jfCagwkaeEJ4UKTn2w3kUm2ZtIi6sL1Nw/EbhUG1YkkcgB6Vca/RMbETwZrv1YFeUDsKvgbnCYn+F6Yq//cs7EG6dEF5187rVoIIWEsLP5YDgVgkpE5dH5JDLc3RSWSVA+WRuUZsqpLaVIfdkEecvn+iDBhJwvTU4rHqOacRQMNSJ4GUcjRZE76A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGA3QKoC5GGO0PMfYPKtHLk7Feu5YJ20Q0la1CLP8t4=;
 b=cIztJ3sq/Gsgk2bh1+Og9/s9HFKEnsxROH2wdonrgZ5v6K29sZ82FWmxmkZTjDwiHi15vNXX9oQwgkuEN9XAa2VNcdL60qctRyqsmo8kRlrEffE0XMt2Ef5zqBZFiin0S9jJWB6tLN3t6L7t3lFPyBMrql9ehEKk4qTVv9MxpSgYbUrXJb/v1j6QdrHJKCdm2Opqju38GcTknzg/rCWej3ZGU5+x/B00K+7qNl4X+P3EbarKMHzZlh53disGXEpAkEl7T5z/Fagsbsb5BsE45mF+/kYxWt7FBcuzaThmBb9vBDsTE9Np52mtiqjsVaLRsSbGtt0If2spFBz6cpafCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by IA4PR12MB9811.namprd12.prod.outlook.com (2603:10b6:208:54e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 04:30:02 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 04:30:02 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v7 0/4] gpu: nova: add boot42 support for next-gen GPUs
Date: Tue, 11 Nov 2025 20:29:56 -0800
Message-ID: <20251112043000.83071-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::23) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|IA4PR12MB9811:EE_
X-MS-Office365-Filtering-Correlation-Id: 600c706f-df4e-46e8-266b-08de21a42532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eIgfTtelKCO499DQCpWmo9cJvfb59SAKybnTBwWKvSJNKfF/rI2JQHnno8lH?=
 =?us-ascii?Q?Vmyk2sbAdUQ8+M1KPXfy4lJ7/ya1SlWS8j366f0u4rkY6WDY8VXdlLkE/cXF?=
 =?us-ascii?Q?Iek0GMyMmAGSl75G+PKt4n+7dzjbwcyVzPDKyJAcWDt4duYYW97y9OuLUmoG?=
 =?us-ascii?Q?COQuxoLgVd9bJeU9JboPzg6zK/dYnApHhEzSKp8plCtMOOHM5DXUdOt9G9Hf?=
 =?us-ascii?Q?RyVYADzEY99JAiHlfqcaEDrtqYmc5r5YBMbrOfzKqU0XfH2Yxw2ggsIpE6BI?=
 =?us-ascii?Q?tB1yn/RMlC1uY53EBTcIAGBHG9RSQE85ZTySAs69+nNtSpdldDr9k6nvH7OI?=
 =?us-ascii?Q?fSjUNo7wTKTfjv8gHY+7rhjI9eF6delb8T2OLtNXfVVdkDsnG99A8WJPrfvg?=
 =?us-ascii?Q?OII9oOwrWk9MAO1OblBXo/zeFhzN4reDrYC9ldTh1TM65gOyjifoOSIEcnEH?=
 =?us-ascii?Q?UnNndbEowfTYvvqZIVPAfIQ28BRTW3cmYrfojPjkYp0i0rNUundEZiWsdp3I?=
 =?us-ascii?Q?RSkeem36rQWAr1j5l9GO3i9zu9tv7mLMqoVE0jHe0o753u2lv9Fd6gptm3IH?=
 =?us-ascii?Q?mysanm77JHTvTRsovcGa+wIV0sWn4TdqAxLgY555rRs9qDfWiTEnEIJWzjBl?=
 =?us-ascii?Q?hQW12+icE4rwdgvuGcayG0HKo6mEDVkXI8O9cTctEVrexrO7d8yys3To97Vg?=
 =?us-ascii?Q?JGqZkqJ4yo4SM1A7xqYDbQ7uPrjCwlGvHLUNyynsBL0CUeP7fvqsxGrpIe5M?=
 =?us-ascii?Q?ISzU6M2x+J0P/ObAvrSBFMuyM2cbcOrmJkFvdh5qicPHkuycRPoWGm9CvTdK?=
 =?us-ascii?Q?qschyQ91FIs/itEaL3Yg0O0X18WwZJz0Y6u4A5D3gJvknvB5NHpahZhvCZXP?=
 =?us-ascii?Q?AFNt0aakWPa2AiODW8+mEu7LnjCPfc6lY2cyaAc7z3xSRv8YbssCPMaKquYk?=
 =?us-ascii?Q?qbyqNBbOlDtX7wAg7W2DRjwgdCjeVVLjMOY8d70tnlOnvnF/5qn/QiBJhWJk?=
 =?us-ascii?Q?4np8L0bRA+cY/kYPpR9Bw7rbtrUWYUIkDLdpmS0UpP2ep6QDanhYjlEIJzmQ?=
 =?us-ascii?Q?joRGnNNuLJrS9ggS82EgPfyS85Ry5V7PFgQtAQG53ivcG7DRoLKpxbqfwtS4?=
 =?us-ascii?Q?R9Y9dgstQpqrsXo4v/kN8ZBSXZks6hSueg9igG9/fY+i4uT/qj/az4TosT1Y?=
 =?us-ascii?Q?YYVkd8gQxfSSuunNQU1HowxVqhD+gMqMlh+ePvX3dDBO/NBAIhu1Sd+lgiCe?=
 =?us-ascii?Q?q+0u4huQicppa2jVm+InDAr8XDi0lapBs9qYYBLwM08MHFa5c2GGDTRSVEqN?=
 =?us-ascii?Q?QATgi0waPtYM2Ea9gz5+3jk89DoAnK2SyLSqT0kot0TatIzrYPHFpczQ+Vc+?=
 =?us-ascii?Q?jwxQ8zjvD0wxv2L7/RsAN/BVOsoEs/ssnhjTAdleUYAMtvc2HTEGOldB4Gll?=
 =?us-ascii?Q?TuV98e6AUWP7u+LRVTCx7/vgDZn5PB0F?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dSTwMdmSp3MG1+NxOAuNu9VrTwxWIea2vywKUYSKuLAPtSKQdjmSaqnq/yaN?=
 =?us-ascii?Q?dc5g1yFtN53i1kv4mXIu0ECBHLUS2Yw//qf9YnRoXtHpgMCOayjt/o2kmiTP?=
 =?us-ascii?Q?zZyscKSD6Rbk+uJofOkdknk/ZjlNa9DLNpicSVgvyIt6i+3Ntnutg1IraJNy?=
 =?us-ascii?Q?Kk+nyZ4xLR+RfCUGR69XXyzRvrZSdTKd8TCc6Tziy5bsVIfDKGKd529lok8N?=
 =?us-ascii?Q?WvscAMztm9Va43+onJB5mg1YIlSXmqgFl0Uyab8NXsMlqTWg0KmwFYxotspE?=
 =?us-ascii?Q?evFZNvW9IfeX8u9T5RthvFFjnaSrIyeApaVG7rcunE3ER8EMVWsfnbCuV2MP?=
 =?us-ascii?Q?+Xd8SIL8yIvXLVYEq2SWEYYuGlTYkZjbSTzIrwM/nt8rU8GgyWJCIJR4q3uI?=
 =?us-ascii?Q?6OCnsDXcAZ41eX0ifpKKKHbXh3B+JX3wzXRyM37vA3npf3zbeqMugqxJ7oQ+?=
 =?us-ascii?Q?OrS0hoj6ho6r06Q/6RrOFS978Y9+hQ4ecxoWKeWqYjlCX5eyBqD5ShrUdZeN?=
 =?us-ascii?Q?urHta+JajIS/nYTIMfUc3iCyvr1S45y5Dmkbywdarfj4+dLwSfoQ6s/asdl+?=
 =?us-ascii?Q?lworF+MbGG2sr5svCr4KMOQAGIduL+KMvFP9zcP4cQO7376RSl6/N1HQqDyr?=
 =?us-ascii?Q?Iw9xvZlS9cT4OCu2P84ylesrEUvcAf6nv7Mvtp0WAtVfcehfPT/zgglptjns?=
 =?us-ascii?Q?IEYoDu8ihl3NcE5RKrkoLnpbJZr/oBWsb2V6uBF2v/OwjEQTHlzheW+hV+Cx?=
 =?us-ascii?Q?dN255qLo/b4YWrDQ5yAmWdxzAd6yjEb+jx1jNriF8yPZmmzvUAwRQOYHhIg3?=
 =?us-ascii?Q?VYGh0CmgLoFtp34YTQ1bh2O9wo1eT8jYaN3Dh2qyCAOgwuXPmFL+aTUieD+Z?=
 =?us-ascii?Q?szQvSKkVjEyLAG+BUaiOO+sCk/yHSnJ/X19tH5sKipZTRuF2oyjS/CP7kQF4?=
 =?us-ascii?Q?Q7oxpZlMld1E0HQD9rGY4bEiyMIxxmGpLGxPL6effEx2UIQXNvMnANQK+zrD?=
 =?us-ascii?Q?AZX78MOlytyzXN859Ke9Ar927RK9QqCAiNlnNT2SYhHU7plEgjeMLkYa8oNX?=
 =?us-ascii?Q?SWDnZ0tsqEOyX7EbjQz3BnooEou8QD8WDYQDCKEkvnmBVGcohNmlEeYQq5uh?=
 =?us-ascii?Q?3wm1PqLShaMIasQfqmfvoOGwrJFGgzvB8TIWI8u32YNv5iJ04/5c3hHEdgf3?=
 =?us-ascii?Q?TRx57PIdpVZRcPpm9HHZ+xZ77sB3VN5HbBdKxJEAtyMYT2vgnRoB2vmag4s+?=
 =?us-ascii?Q?1+tlrz7nJ0KRMZwVGLxk++J5+rRBwqELCCJJZgiQEXHIEXE/FzUtz9hLc2+A?=
 =?us-ascii?Q?sryULcxB2m8hHHdZ55O/InwOnh0r6gu18mJQJaLrQtXy0kn51y3NHxfB32Kq?=
 =?us-ascii?Q?r/w9r97JFexV5c41bVgVzt7MRNKBkxl0+CSjgqfXud8nctI4KYNS2R6Gw8iZ?=
 =?us-ascii?Q?4sSro4ZASdSK3sneNIqqNklkZH8qKCjbcMJLCNEMnLIE8/NAOx7p+t8wOrj5?=
 =?us-ascii?Q?3ID1wttwfRb2AmvgUHZ07PYt6ogDS887uKW8gwnX/ROyabuWgG0KlaANxKfc?=
 =?us-ascii?Q?+rGU+vNKAQE4Iqcjwqu6CZ/0vMUUSlYvWoJx7L/G?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 600c706f-df4e-46e8-266b-08de21a42532
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 04:30:01.7682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sx2FdoFiUKmDJL+442KZMBIDaCWRgPDsalM+SrKE0d13qPVFrbyPVPRugtAXnptWBNVtOZ9YVLtjgtUP8/bzwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9811
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

Changes in v7:

1) Added a TODO to eventually remove the Default trait from Architecture.
2) Further refined the logic and comments for reading boot0, then boot42.

Changes in v6:

1) Split out a separate patch for implementing Display for Spec.
2) Moved Spec implementation code to its proper location.
3) Significantly changed the use_boot42_instead() logic, and updated the
   comments accordingly.
4) Fixed the boot42 register and field values, which were wrong (and
   had not been exercised before).
5) Imported Revision, to save a few ::'s.
6) Rebased to the very latest drm-rust-next, which now includes the new
   "one 'use' item per line" updates.

Changes in v5:

Two fixes, both from Timur's review feedback (thanks!):

1) Updated both the cover letter, and patch 3 commit description, with
the correct description of the future contents of NV_PMC_BOOT_0.
2) Removed a trailing "boot42" typo from a comment in the code.

Changes in v4:

1) Simplified and improved the decision logic: reads both arch_0 and
arch_1 fields in boot0, and skips the unnecessary is_nv04() logic as
well. Thanks to Timur Tabi and Danilo for noticing these issues.
2) Added a patch to represent Architecture as a u8. This simplifies a
few things. (Thanks to Alex Courbot. I added your Suggested-by to that
patch.)
3) Enhanced the Revision type to do more, which simplifies the callers.
(Thanks to Danilo.)

Changes in v3:

1) Restored the Revision type as recommended by Danilo, but decoupled it
from boot0.
2) Applied Alex Courbot's suggestion to use TryFrom<NV_PMC_BOOT_0/42>
for Spec.
3) Reflowed the new comment documentation to 100 cols, to avoid wasting
a few vertical lines.

Changes in v2:

1) Restored the Spec type, and used that to encapsulate the subsequent
   boot42 enhancements. Thanks to Danilo Krummrich's feedback for that
   improvement.

v1 cover letter (with typos fixed)

NVIDIA GPUs are moving away from using NV_PMC_BOOT_0 to contain
architecture and revision details, and will instead use NV_PMC_BOOT_42
in the future. NV_PMC_BOOT_0 will contain a specific set of values that
will mean "go read NV_PMC_BOOT_42 instead".

Change the selection logic in Nova so that it will claim Turing and
later GPUs. This will work for the foreseeable future, without any
further code changes here, because all NVIDIA GPUs are considered, from
the oldest supported on Linux (NV04), through the future GPUs.

Add some comment documentation to explain, chronologically, how boot0
and boot42 change with the GPU eras, and how that affects the selection
logic.

Also, remove the Revision type, because Revision is no longer valuable
as a stand-alone type, because we only ever want the full information
that Spec provides.

This is based on today's drm-rust-next, which in turn is based on
Linux 6.18-rc2.

John Hubbard (4):
  gpu: nova-core: implement Display for Spec
  gpu: nova-core: prepare Spec and Revision types for boot0/boot42
  gpu: nova-core: make Architecture behave as a u8 type
  gpu: nova-core: add boot42 support for next-gen GPUs

 drivers/gpu/nova-core/gpu.rs  | 82 ++++++++++++++++++++++++++---------
 drivers/gpu/nova-core/regs.rs | 33 +++++++++++---
 2 files changed, 87 insertions(+), 28 deletions(-)


base-commit: e54ad0cd3673c93cdafda58505eaa81610fe3aef
-- 
2.51.2


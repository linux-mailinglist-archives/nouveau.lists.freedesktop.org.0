Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBA0BE4029
	for <lists+nouveau@lfdr.de>; Thu, 16 Oct 2025 16:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173F810E304;
	Thu, 16 Oct 2025 14:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MRNruNXi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010041.outbound.protection.outlook.com [52.101.201.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD29010E304
 for <nouveau@lists.freedesktop.org>; Thu, 16 Oct 2025 14:51:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akwxaUpFFaMFVgLgQGd1rtS8G5y8qE2yvYevI8Hhj12+VHYJi6AdsOCMNLQfyW0wgLIDLzZRLgadiPS/lvg4yPjDfBAQaByh0+rSj+S+cIaZ3bR0cVrrF6L7MeZLLE+l2QdYHjwXYViOvvoC1rjTMeOc/clp/vB9Bgi56PSBhpm+igAwKjVV92v/mMajGw88Bz23Jbj2MXX5BXigRrb7xgF+cEPo0RVWhSZ5RVND/RPv+qa/McUR8OnPRt/xq03uiy4dNNRDg8cvDLq249LfMLLjxfWlGx7loCSnXxnAH214Ubd0fB+bDfkfJD56dtDNC1VVCILlStpKW/IYnzGoVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LE8pr0Z+YzMdA7/EIXlYYQYVL4KtMn2Is7s52FZlpUc=;
 b=GHV8EhJRYyhmXZLZdwwNIM+syY8MnDUtRo2dj7lBTaz5fE961Wv8TqaNZiLgLdP49ErxE5bLPYWZTJj7hngYFlduVWbZnEgiIPKLGaTRsDbsyqBLtcn8YWz7BNZ9xK/kfFHUfqIYp07J+fOl9JDG4ovqu1pYIgIi5obOYpZnXgjzpiY5YSncido5deqP7GRPfDouptOzXWNa4BM2i+BSplzwiCLbQjnD0YNTvNFqyZja6UvIfgYxRkCWEYO3/cTQKdff7I+ozKPG81MJRxNkZz6VChztVJZCRA7RGYHHGyVUAQFlhvp6EwHW7CH10dzJywHVYB/vogGmZsClejffrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LE8pr0Z+YzMdA7/EIXlYYQYVL4KtMn2Is7s52FZlpUc=;
 b=MRNruNXiOpWfIDLCIK4leXKGUaEOGuLofFkJvO/OnbTwCpjb9kEtNMdzpwQbWBAq0U5qYIii8mQkoPkiKKfGtfH+sz5LMjRun/0Klj/WZA6cnVKG25/HrVbakTO6V2i3PER/uVLmTUdEcoal+2IJSch4NrQ428klfQxAO6BB8nWZAoxfYx3UduroxKjbZugFpNH9svt72lyZffKZsJF+8z9kFROa1HiGLVAJwA0wCHhaVz70eNz1A8CPIITCNXGeaXY/BvdEEU7OitnycfxnmUjfOukWU4NePrzBq70AWitFkfj5cGbn3+n3L+mZnk5y7VsrZ7OvgjuJLP3yCF6BNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MN2PR12MB4336.namprd12.prod.outlook.com (2603:10b6:208:1df::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 14:51:08 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 14:51:08 +0000
Date: Thu, 16 Oct 2025 10:51:06 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Edwin Peer <epeer@nvidia.com>
Subject: Re: [PATCH RFC v2 1/3] gpu: nova-core: register: use field type for
 Into implementation
Message-ID: <20251016145106.GA1174880@joelbox2>
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
 <20251009-bounded_ints-v2-1-ff3d7fee3ffd@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009-bounded_ints-v2-1-ff3d7fee3ffd@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0230.namprd03.prod.outlook.com
 (2603:10b6:408:f8::25) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MN2PR12MB4336:EE_
X-MS-Office365-Filtering-Correlation-Id: 9441352a-e8ef-4142-d2a9-08de0cc370ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yjfWLZL1+9LN0kjUVsTYs/LrOYI3GxT/TbhD/jkxskmoB1BN2q2UH0zE73vB?=
 =?us-ascii?Q?iAo3P499UiRJm6xRB66gHd4RiQh/XGeR8Kzg++/VzWuzK3PQnAMG1DCWWKmT?=
 =?us-ascii?Q?ZB4cG0A/M48XijOnlugWRac6Ja1y/90W6K2SmHTQhx3+m+nKbzwU6E7J831L?=
 =?us-ascii?Q?U7mSE1Jpug85aU2uJL/Gu3bL5nB/7ZndU4RdV2qsNnKdN0hfW7fkTxvIB7zz?=
 =?us-ascii?Q?F4z9EHRRuYV0TghPDmC8RZdqDJkolS+QvQ7MmXZSuku7OUCfOwdF4nl4RbYl?=
 =?us-ascii?Q?ATZ7kvrLlzhoXKIw/1/KWtwyAyPnXnZ78n3qdCD6OWQypQNBiXEp3SR5s9Yh?=
 =?us-ascii?Q?tBlXy/51kEHx8x4XBK3XeaAmwxHa6KmPi4G1oiuiWG7Tb4buljdLHSoiZ1uF?=
 =?us-ascii?Q?fQy2wgwKD9mlHbpSkBxZa8QJg1r33wGSEElzvGK+NWpLjy+Q3KR4LUROD/We?=
 =?us-ascii?Q?ibYkpkO93DUwUBAHWU+tmeXyq3CFg+dQxq3Ua7eUn9jaI6FdSC9RT3mq2BMO?=
 =?us-ascii?Q?DLsUJPBE061OYZT4EM9Gn7KJal0M/R40ThQVixJuH5uJdPxlbrQ2A6kADq3L?=
 =?us-ascii?Q?EPPF2wLBDeXAbqPYTwl1NpIMNV09Xbxfp7A1Qy3C9bGOLZ7sQaH7zYAXcFHC?=
 =?us-ascii?Q?u4e4i5WSfV0fZf1ElMCGxdj72htPUJ5JHkYaCUaxjjMAKdvo8lVKZZ3LMp2q?=
 =?us-ascii?Q?EgPofXta4EwDfW4iEjUYkg1qwNG1Rz10c3TbYWZd5GirQ6rS6P+OyaMd1NgQ?=
 =?us-ascii?Q?8xpMC43IIc51WfVmI7lfLvSiatoycaEK8URaaBdFnVwqWGHHChLzjljf9OIW?=
 =?us-ascii?Q?XGeKKaYeFLg1nYy/menwwPncmy91O7XtqMRT9Uo0S0B2BIyXkUmeqzldipIY?=
 =?us-ascii?Q?7rixM6j7uBQl0V3leNfegQY5Cj+orNj2jV+GaqUTOoVYN22tfVYSBGTdwuCg?=
 =?us-ascii?Q?dSBpGB49dXYcyWAkCrhzixuUFXX9E76VJVPB9BEMRs51Q0SnaEjpMRpzDqtz?=
 =?us-ascii?Q?bNaDppXEXgpofI5VWzIPslSLSnmeM5GsPCyUWkGNQl7pJ6ajO9egJyVWfDMR?=
 =?us-ascii?Q?TVL6vr8RJJuG0UZdv8xZsmVQasNMYLX2TtCTGnf5+HDrzmSALo03/0OVagdW?=
 =?us-ascii?Q?ApWEWV/JioRMqmp8qFEmKJ716qVqSnLUSZO9LwSTjwDLOt+BaLzWBWGDWStA?=
 =?us-ascii?Q?sMIcjjSxKm++39vzgWSl8DKjG9xfj9xI4txewrvn2c2Hco95OXkBZzGMG3+q?=
 =?us-ascii?Q?NCZgVPnzRePii4t13oO6ICzinZzVl2oGaCwkK28J9qaL0js0seilj5sivQZ4?=
 =?us-ascii?Q?gdTLGIi1N9uPMyzNMNIGNIBMPQ7QwceeIFxFpjQ9tTejzXPCacG9cbGSnQaF?=
 =?us-ascii?Q?IaEv4rpmH+lwdF+zV0HI4qdEHbxXSTOI7FvgCG4fvCFspGw+vfPbN0Q6gqiz?=
 =?us-ascii?Q?rDmkqLiSfcjGh0BLcdfX94pg8XhT+FT4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TKQUPdaKM2jjV6f7k2bhREpOJZH2TiIms2fNg3tRwrn8iGjauLHEIRrWOoEk?=
 =?us-ascii?Q?PVwT34K8Ew2fGCmusvF2LZ3cc3zqKD4j8w2iLkkOdSVZ7mllbtLhLTu+IU52?=
 =?us-ascii?Q?BuoRH+S1MgOZijhpMo+5WuckcKCLdU5xKRaACyGXX65wb2WWvuNiPcjQXQjK?=
 =?us-ascii?Q?T6e5RE9Qa9FcdOE2jnaY3J7VsU2CDFh/9Lh2aVNjSu9x7xUn55HemTc9yb2b?=
 =?us-ascii?Q?RI5P5a7C9EfhnGYig3tKqESXOQU7HbxihCcRiA0JNh90+o1LNm3DNauhk38D?=
 =?us-ascii?Q?V4Dq87GpxsEfSoIuAkvjssv12QitxRdyUt9b0g1iuTEcrEQ8dWL0c7lGV/sD?=
 =?us-ascii?Q?Nu6r7gFX7TImj0rWRHDuewLcU6QYxzGZS7CK0vx6ERQ7Um/Mz/7z7ifj9jS8?=
 =?us-ascii?Q?xxUx/9aStwC4nL5dduDtYjPs7bu5HJv/pavnrpTl+gFrHQyYu2gNXzSP/+QZ?=
 =?us-ascii?Q?NHHpzySyxi9mbpFFpUWYgk0b3WMC7Df3BsDbyqqxvRQiBs5BfVAwHOPADNxc?=
 =?us-ascii?Q?IhIEC+1AMCaHSMlPTECxoTOsmVIaes4GMoz1Z76csYTmM4whvJD2UTY03+5Z?=
 =?us-ascii?Q?KkSNMzFO+Xhz2DjsevUXVt/UeMYQAmKu/qr1H04HCy+CDpn6dkz3bvDJTQ5k?=
 =?us-ascii?Q?pPnaOUcMBI67BLfJqAfEMZL9XcQgq0WZGWKoOPYxOTgptnFmrpsSwPBSAsVz?=
 =?us-ascii?Q?lMAue6J9/OlFpWdXwnYjPbVRzxX6IumFFd6MSDhxIOPFnX/QQ79I1a5dCKY3?=
 =?us-ascii?Q?CJkJPA1zHlMF4UZ/5WyMlHqP8Y+pLq/hpwgXGHa6gLXFDLj2LM1O+P2df3Hg?=
 =?us-ascii?Q?zrow9MqfY/v2hCD1OdHPGPHq8H+e6V0kn3OpAqyWqxUKShDQ0L0P7PwIUCaL?=
 =?us-ascii?Q?94ri1vVb/pLLkn877eozJxJzAn0PUQ7pYM8zQ8jq8HhPwZGVeOwlpPKfj1XW?=
 =?us-ascii?Q?I4h3YV89lXfIu1tBLJVCX/XbID8DWMMTAiONvV4mMBFCB4hQudpdx682jUQ5?=
 =?us-ascii?Q?Bg42FTtIEJhqMM4nrYGunaGQDs31R6ezjvHZ33XDz5g9TPd+GhFKjBxPnUQf?=
 =?us-ascii?Q?h0dbTkOVT7xc1L9yJ/TtOpeeTwC5DK2E1sV03oQCTM7QUsAQgIldDerDouwh?=
 =?us-ascii?Q?rAGKed606wwQR/x+exUIiF1owBy29y3EcXyy7Beh0pdpfiLjeGNeAbnPgAJ1?=
 =?us-ascii?Q?hG2c0VjDIey/z1gqbO6Sxxi7Yq3y/VvIwayIxuiX2TaKsvnAaD2bPIt57UbX?=
 =?us-ascii?Q?2H0LBxCm9yk7SO2Sp8PMuyVH9mQLpiij5+hPi2daYZ3fRksJYrzv/810odRe?=
 =?us-ascii?Q?O2b0SFXabpIYNNNYbM13H8DAf2NqRuIova9uPjobRBG4mhPfCyw36Zkwu9l8?=
 =?us-ascii?Q?yFdCicsFxKzQjLbolZD44tI9TLBwdyVaSOtUD/4B8ETzl4wRswm5fo071iiK?=
 =?us-ascii?Q?PL4i2BzyBDX7VDR7a1Avv5PeoI8Jsg4FZvpw+Gu2tksjZi33CHLzFxUCvXBN?=
 =?us-ascii?Q?y4nz1SAAjBCI5eCJvGdtnwjkq5UVo3SGR1fQBO75Wh2xNYXPJalmFtnBZv8t?=
 =?us-ascii?Q?Lb0KtPPqwFzQXuAj6RY1rO5UOejs6nIABDsDSi6Y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9441352a-e8ef-4142-d2a9-08de0cc370ca
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 14:51:08.5895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lbh7XRlcVMVmDrBEmal9wusCny5CVD9b/b5kzL5hz3NyrTuK0JwLWEzMPKxyrJkRoodCvNyw0Gay8QweoWbD4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4336
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

On Thu, Oct 09, 2025 at 09:37:08PM +0900, Alexandre Courbot wrote:
> The getter method of a field works with the field type, but its setter
> expects the type of the register. This leads to an asymmetry in the
> From/Into implementations required for a field with a dedicated type.
> For instance, a field declared as
> 
>     pub struct ControlReg(u32) {
>         3:0 mode as u8 ?=> Mode;
>         ...
>     }
> 
> currently requires the following implementations:
> 
>     impl TryFrom<u8> for Mode {
>       ...
>     }
> 
>     impl From<Mode> for u32 {
>       ...
>     }
> 
> Change this so the `From<Mode>` now needs to be implemented for `u8`,
> i.e. the primitive type of the field. This is more consistent, and will
> become a requirement once we start using the TryFrom/Into derive macros
> to implement these automatically.
> 
> Reported-by: Edwin Peer <epeer@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

thanks,

 - Joel

> ---
>  drivers/gpu/nova-core/falcon.rs      | 38 +++++++++++++++++++++++++-----------
>  drivers/gpu/nova-core/regs/macros.rs | 10 +++++-----
>  2 files changed, 32 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
> index 37e6298195e4..3f505b870601 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -22,11 +22,11 @@
>  pub(crate) mod sec2;
>  
>  // TODO[FPRI]: Replace with `ToPrimitive`.
> -macro_rules! impl_from_enum_to_u32 {
> +macro_rules! impl_from_enum_to_u8 {
>      ($enum_type:ty) => {
> -        impl From<$enum_type> for u32 {
> +        impl From<$enum_type> for u8 {
>              fn from(value: $enum_type) -> Self {
> -                value as u32
> +                value as u8
>              }
>          }
>      };
> @@ -46,7 +46,7 @@ pub(crate) enum FalconCoreRev {
>      Rev6 = 6,
>      Rev7 = 7,
>  }
> -impl_from_enum_to_u32!(FalconCoreRev);
> +impl_from_enum_to_u8!(FalconCoreRev);
>  
>  // TODO[FPRI]: replace with `FromPrimitive`.
>  impl TryFrom<u8> for FalconCoreRev {
> @@ -81,7 +81,7 @@ pub(crate) enum FalconCoreRevSubversion {
>      Subversion2 = 2,
>      Subversion3 = 3,
>  }
> -impl_from_enum_to_u32!(FalconCoreRevSubversion);
> +impl_from_enum_to_u8!(FalconCoreRevSubversion);
>  
>  // TODO[FPRI]: replace with `FromPrimitive`.
>  impl TryFrom<u8> for FalconCoreRevSubversion {
> @@ -125,7 +125,7 @@ pub(crate) enum FalconSecurityModel {
>      /// Also known as High-Secure, Privilege Level 3 or PL3.
>      Heavy = 3,
>  }
> -impl_from_enum_to_u32!(FalconSecurityModel);
> +impl_from_enum_to_u8!(FalconSecurityModel);
>  
>  // TODO[FPRI]: replace with `FromPrimitive`.
>  impl TryFrom<u8> for FalconSecurityModel {
> @@ -157,7 +157,7 @@ pub(crate) enum FalconModSelAlgo {
>      #[default]
>      Rsa3k = 1,
>  }
> -impl_from_enum_to_u32!(FalconModSelAlgo);
> +impl_from_enum_to_u8!(FalconModSelAlgo);
>  
>  // TODO[FPRI]: replace with `FromPrimitive`.
>  impl TryFrom<u8> for FalconModSelAlgo {
> @@ -179,7 +179,7 @@ pub(crate) enum DmaTrfCmdSize {
>      #[default]
>      Size256B = 0x6,
>  }
> -impl_from_enum_to_u32!(DmaTrfCmdSize);
> +impl_from_enum_to_u8!(DmaTrfCmdSize);
>  
>  // TODO[FPRI]: replace with `FromPrimitive`.
>  impl TryFrom<u8> for DmaTrfCmdSize {
> @@ -202,7 +202,6 @@ pub(crate) enum PeregrineCoreSelect {
>      /// RISC-V core is active.
>      Riscv = 1,
>  }
> -impl_from_enum_to_u32!(PeregrineCoreSelect);
>  
>  impl From<bool> for PeregrineCoreSelect {
>      fn from(value: bool) -> Self {
> @@ -213,6 +212,15 @@ fn from(value: bool) -> Self {
>      }
>  }
>  
> +impl From<PeregrineCoreSelect> for bool {
> +    fn from(value: PeregrineCoreSelect) -> Self {
> +        match value {
> +            PeregrineCoreSelect::Falcon => false,
> +            PeregrineCoreSelect::Riscv => true,
> +        }
> +    }
> +}
> +
>  /// Different types of memory present in a falcon core.
>  #[derive(Debug, Clone, Copy, PartialEq, Eq)]
>  pub(crate) enum FalconMem {
> @@ -236,7 +244,7 @@ pub(crate) enum FalconFbifTarget {
>      /// Non-coherent system memory (System DRAM).
>      NoncoherentSysmem = 2,
>  }
> -impl_from_enum_to_u32!(FalconFbifTarget);
> +impl_from_enum_to_u8!(FalconFbifTarget);
>  
>  // TODO[FPRI]: replace with `FromPrimitive`.
>  impl TryFrom<u8> for FalconFbifTarget {
> @@ -263,7 +271,6 @@ pub(crate) enum FalconFbifMemType {
>      /// Physical memory addresses.
>      Physical = 1,
>  }
> -impl_from_enum_to_u32!(FalconFbifMemType);
>  
>  /// Conversion from a single-bit register field.
>  impl From<bool> for FalconFbifMemType {
> @@ -275,6 +282,15 @@ fn from(value: bool) -> Self {
>      }
>  }
>  
> +impl From<FalconFbifMemType> for bool {
> +    fn from(value: FalconFbifMemType) -> Self {
> +        match value {
> +            FalconFbifMemType::Virtual => false,
> +            FalconFbifMemType::Physical => true,
> +        }
> +    }
> +}
> +
>  /// Type used to represent the `PFALCON` registers address base for a given falcon engine.
>  pub(crate) struct PFalconBase(());
>  
> diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
> index 754c14ee7f40..73811a115762 100644
> --- a/drivers/gpu/nova-core/regs/macros.rs
> +++ b/drivers/gpu/nova-core/regs/macros.rs
> @@ -482,7 +482,7 @@ impl $name {
>          register!(
>              @leaf_accessor $name $hi:$lo $field
>              { |f| <$into_type>::from(if f != 0 { true } else { false }) }
> -            $into_type => $into_type $(, $comment)?;
> +            bool $into_type => $into_type $(, $comment)?;
>          );
>      };
>  
> @@ -499,7 +499,7 @@ impl $name {
>              $(, $comment:literal)?;
>      ) => {
>          register!(@leaf_accessor $name $hi:$lo $field
> -            { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
> +            { |f| <$try_into_type>::try_from(f as $type) } $type $try_into_type =>
>              ::core::result::Result<
>                  $try_into_type,
>                  <$try_into_type as ::core::convert::TryFrom<$type>>::Error
> @@ -513,7 +513,7 @@ impl $name {
>              $(, $comment:literal)?;
>      ) => {
>          register!(@leaf_accessor $name $hi:$lo $field
> -            { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
> +            { |f| <$into_type>::from(f as $type) } $type $into_type => $into_type $(, $comment)?;);
>      };
>  
>      // Shortcut for non-boolean fields defined without the `=>` or `?=>` syntax.
> @@ -527,7 +527,7 @@ impl $name {
>      // Generates the accessor methods for a single field.
>      (
>          @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident
> -            { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
> +            { $process:expr } $prim_type:tt $to_type:ty => $res_type:ty $(, $comment:literal)?;
>      ) => {
>          ::kernel::macros::paste!(
>          const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
> @@ -559,7 +559,7 @@ pub(crate) fn $field(self) -> $res_type {
>          pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
>              const MASK: u32 = $name::[<$field:upper _MASK>];
>              const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
> -            let value = (u32::from(value) << SHIFT) & MASK;
> +            let value = (u32::from($prim_type::from(value)) << SHIFT) & MASK;
>              self.0 = (self.0 & !MASK) | value;
>  
>              self
> 
> -- 
> 2.51.0
> 

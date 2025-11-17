Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB31FC666E5
	for <lists+nouveau@lfdr.de>; Mon, 17 Nov 2025 23:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BA310E051;
	Mon, 17 Nov 2025 22:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PbwekUM1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011016.outbound.protection.outlook.com
 [40.93.194.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5729410E051
 for <nouveau@lists.freedesktop.org>; Mon, 17 Nov 2025 22:33:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tpmoCh38MIOl+aThAHfVtpokgg6McabS5D8u2ukIOVm83D7uKerT15qd0B/qO5Z5/DDWiIC1dKKXbmfhKVmEPyQvmIHQROkbE4FOtyeLxP6Xu96USjq3jIys0au/X+sd1ks6OxPRHnroea4cagsTdkI+DnZLZzzABPMQKQqdBQ6yuWVLJh/CpnQHrcoJJl98/hVTDbc6P3vz9U5AeLnsbb+2v4bHFGyBJawmRhbyVp9dmdD/DK4u2/H8QYABtCWYTVC7yrHxe46OfIuj35ff6xc5MTAgasB5HfCHQLeIlvIJmLjxnXM2qaiU6/J/nR1S69iolKeCvfGMy5D529coxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIR+rDaOYL0bBPCbf9a1dZ1dRhhauEzN38lw8qjylDw=;
 b=vFiUhELJMS71gfoFmDD3x6ul4sU0m2dl4RLBpwSw4bH/Td3tK+fhjlxLCkpCZzzVzjnXxIpF2vxB2192KX2CajLt5v8QvJnwFRm1Fezi0iLi+A3bT8ERfYcLcSaXQbpefBURV17BM0dHfoUi1hx9ymLSRQJtVU+uNXB+IK2kJalsEMCzbKH38BpbNV2GkzQDnpfJjf+ehg9zkIou2fy3JbKtX0YwwQn7WtWy/H1WYnOs+CxAX66KOWTX7H/2ZlNNLNEOE8K6f/hujfpGKPISYETyMWf3dME0FMi6Y1Mbto0nPUTDi+QAOFuOnJtnBF9L6g9BiOF++Zz6YnzR14B74w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIR+rDaOYL0bBPCbf9a1dZ1dRhhauEzN38lw8qjylDw=;
 b=PbwekUM1DURBiSAUW8UTaD7SOuVZp0C7n3BSdec9HCGtgSzvjZl/RIKQLL6b2LESwJp5BAmR75WsfQR+wHAwxJcTWajgJ/A70NMXwgxnXVtOnkwuuMJvbtm3epbsZf/c96mcMbcW+d43yfDS3/5NUxkbzhFnZmBhKhFDEzdp+HMnGK56eDd0/qKdgJn3s6KlNYERItGRm6Exv4bNb8y9NLX68Dt3V25iWknWMoaBIN8OjA41V9+0ITtuq276ab6L9ylZeNqw2YiBAS090Jyx7c0mHb0HS/tKDleLrfoZ+UImKQ0dyaMJjU26QYsU5yulSI6KarHBVmElSWYnEXFQ1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB7641.namprd12.prod.outlook.com (2603:10b6:610:150::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 22:33:26 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 22:33:25 +0000
Date: Mon, 17 Nov 2025 17:33:24 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
Message-ID: <20251117223324.GA1094429@joelbox2>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-4-ttabi@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114233045.2512853-4-ttabi@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:408:fd::7) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: bd54f58c-8fdc-4f1b-f9a3-08de262952b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sAvnUhHdTlhyxEZGXfKmn5SLURAESixRxMis07YBAkmrhy1qRsLaRrD9kjn8?=
 =?us-ascii?Q?2g4DKxR8zXqDY5imIi/43OAmLBqgLBpuCdr7DgIp5QuRueUtaGBsY6b0/LIO?=
 =?us-ascii?Q?usdu97G8YVBoLeb3vdc/54z602QE5/6vPrG+aj4YnwGLcXcigmjlqlxfHGE3?=
 =?us-ascii?Q?RNgquCGe+YTI1AWbPgSXD2pjj1ow44HfyWIij62LK/HdNWD6HVmYsIg7wxsx?=
 =?us-ascii?Q?3bTxdLbB5pfdf/FyOLL7QMUvb3c7lQEQUAd62LQG1WevnqUUCGpEkrcQm31d?=
 =?us-ascii?Q?CILN/lRx5kWglVwTcJd2JH+CbvkqoHtgp/ruy4IJuikVPdf3gicr02jtiJ8D?=
 =?us-ascii?Q?41Ru54jbsG7gOSdOSNsCmM7v9emZhs051xnw7dkFFHGawoUiPHENjjQa5Zys?=
 =?us-ascii?Q?S6x/YQtM7uR/ms3MHMhPyGYTGYr7fybHuN0982LnS1OsSLBVXTIe79Pxa8NZ?=
 =?us-ascii?Q?gFvvzhh3TVXltbWO4ss8xG+JUfkheSOEr4WLb9Ikk9HcOeyTNp7PnX4QOiEm?=
 =?us-ascii?Q?MgYakoqmt4tJTTBb5Ov/iOb1N6kPHVD6F4aa9UqYIdhfbO4QsRWkGGsZHARW?=
 =?us-ascii?Q?RNBIh4rV8QQF2ANZxDmgyGUH641nQuA6sSozqcNcpDQlH4TBQ22zBkg+Oadc?=
 =?us-ascii?Q?FapLrsyF7IXmTMsm4jb+Tf3vHg6woLwkztZhSOhJcGCoxIAZ67m55mIpjA6Y?=
 =?us-ascii?Q?do7GCPKwYWDkEY18W5py82KBAGFD0zh6WNLMVo436t/gLl8gqUUKzLKOpUEG?=
 =?us-ascii?Q?GBorTOIyOIrI/uzgj8DcSX4MQJLsG5hWFxry4xNn0YTlduWSXKbFl7/kg9YA?=
 =?us-ascii?Q?GJPQC6ynV9ZPawdhF0H9A7U95Q58ctEWgbVY3aDNIWRZoS1HZpbu5Ug7lcft?=
 =?us-ascii?Q?Rmt9RK3ZJE+H4jSYRZyAedxy2z0Z4L4rqo4yWOgX84+MB2Lol9xe3l9QVty8?=
 =?us-ascii?Q?GEizd8WisvUqh/MIatFb9HqtWsRK4KsbPDxz3IAH41GtgzoY0pf62p4/X9Gz?=
 =?us-ascii?Q?nXVwPuz8CKnos2jlvCBQJq7vUs78SgwMa9nNUtqdDdE5TGd4T09R8vgv6eXw?=
 =?us-ascii?Q?NShT1B6fFQLveNrCcz2R2p+g3ks4B5xSSwh7c++y6DYcE4WnAkv4i95PcWIZ?=
 =?us-ascii?Q?DsUSaAbj1S5j5P+rPydQK49g+q7azYvHqLxbN1RwteFBr0bGKvz9NDz2Vwo7?=
 =?us-ascii?Q?qsHX/4rshAtGFBfauEYXqDJqg5bHCHbtNKjdURiuBnCYCt1cfhvEPMgNkgwe?=
 =?us-ascii?Q?LRmOtDZOMgbdkFQ1fVGHn9ToTXxl/Wd4LsqLIgGbaIImuoF3jIFIT9ML97Pm?=
 =?us-ascii?Q?nDOuF1W+qXFPO84/jzdLUsOE7feJL1jRqN9mXcC/ntLy7d2CNWHoxKL85O3Z?=
 =?us-ascii?Q?6gXMZ1458UCXe7IPcXU0rLmDV0jseveYr88rLDFsbADZYpyQv4FbgNZP/JZM?=
 =?us-ascii?Q?Zedp7uJFts47TFkX/zwa7fqSsysZE3m6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0FBk6XJyaPKks6zw2AD1fFxA92oSam1eRvLtZ8Sw5T7deR5di46MdiuqnK2S?=
 =?us-ascii?Q?mzhiBfMc9CEq21J9qVKh4IayOdNA9HNRTuKst0lGRVi7AAY/zAlKNycEaalG?=
 =?us-ascii?Q?glwBDt4H0a21IcVMRypwckz0opMB/s/C88yN4FZq9uAEtcnvg76CL7p1MgOu?=
 =?us-ascii?Q?UXLFBjq97eI8GKdeaI2an0pyjLdKE9Nowiy5/hjooteortW8xtvyUBiTkdXg?=
 =?us-ascii?Q?/N68868zYPPfXunN9WEOeoz8VK9hPVh4gSnUEfBNIbzmogmhPPoDxftNCBMb?=
 =?us-ascii?Q?55bfgwSoqxGEgLntF9mAjpBvQpl+S2Hbipn0Moo4CS48XDVnsGcOq3OI5RsO?=
 =?us-ascii?Q?RAA41heXqphggDr9JzwHTgZVx8RybY0CE9llXpLiOgGXH2Ma7yDGooU+4ink?=
 =?us-ascii?Q?SE3pk6z4yUmIOBrPah/IO2+sNB2XaYjgHYUkd3YXkoZaV0bgWVAZRbEiDmnf?=
 =?us-ascii?Q?GH/VNQS4LradpEZ/9qHRqcHxKRadc6NKMw2mCNdyaB4RYSshbqqTGclyZSn4?=
 =?us-ascii?Q?WvAw8esh0aII6/5oNsLgtwT9ByNUn6DG74WEcfuGok90ZrMRsTJ8fsfl3x3q?=
 =?us-ascii?Q?Rw9Nw8s1Lg1Urdnx6NBDjhZ6eP2JJXpCgsYoAJINhUDTQ/x0DCrV4pNgvpwy?=
 =?us-ascii?Q?lAlaNWW0mTCDpQmMPZh6kTcxvgUgz4JNGk0tcwCRo4x3itl9e/u1Q99PcHB4?=
 =?us-ascii?Q?qPgi5/KOCeMwkbYf3hqnt/Hb0ac5EyMhaIqZvHU47N24aou3USd1/D6WcM8e?=
 =?us-ascii?Q?rDiQTachS2sM4xLCzHbhXFDi3nfppjQMUmT/7qa0V1E5m0iwVMBGZeoWR8ZR?=
 =?us-ascii?Q?fxsUgv53/2rSFD/BjVIZSaTazZw5KNgdbmU9HI5fVBhvtnuyhfUcj5WbQ6Uy?=
 =?us-ascii?Q?NdUfald7bzLRXmdYmzeDZ3Six46J7gEytRjoU38ZrJ2Yojw+mKiDJI8iAu15?=
 =?us-ascii?Q?IEc+mQv6aZkMuQdD29NR8v3ay8kKWG5EyF9b5QEeLtdeEAiajONrNXJ8+m5J?=
 =?us-ascii?Q?2BHQ1HGKPdnWtguu3LwD8ClMixIhWOHvGdgIIyAlonWJF85E8N3TGH32ktKo?=
 =?us-ascii?Q?VYr334fwxYOnQR/5FtJnyPRnQyO5X+yNcsBpFCy3raYjH4tUUdzWppHWmyb1?=
 =?us-ascii?Q?P8CW2C0Zs7PYZAIKL+4YBAzfJX4yvzngXbGEd9MHoksw5UtRmibrNwYEksI5?=
 =?us-ascii?Q?agYDSBvg1gp/teD4FIWfPIq7MDObBuaPLPs/QtUYmEqEFng4g9o9yTTR8gUI?=
 =?us-ascii?Q?3kMEey+7YJUTw5QJTgM1REKr9v5HtYN74oR8BgCehge1hOmAHJo8VTAMteMT?=
 =?us-ascii?Q?mWujakC+o5R2X4bwT4JvjLag+WmwgCx32gnZVH7e7QnEplZgRViGRiNE9QRJ?=
 =?us-ascii?Q?/koiGu78o3dl/JQcCTj8nY+bE8K3aR+ZHar9n3MpqhYYDYlhLF61TCmhqEFc?=
 =?us-ascii?Q?+tMGfQAms4Upekfos/Yx9yFLiSYBh9OahiPWkgo52xmYDg3FKqFqg7aFUhpe?=
 =?us-ascii?Q?n46XjngjB504HI4+sNSa6SEoZs7mQeSxUYeANh6BOXfhYngwhSa0NwP0a1Pz?=
 =?us-ascii?Q?/kd0zQa89zJ2TuaY47vMxl8/6hplzLC4KgoNPDN9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd54f58c-8fdc-4f1b-f9a3-08de262952b8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 22:33:25.8396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YsNn6WA5f+A+zK7AVufTbfbMqo4DYViebBfQEK2LPmr6gUdop/QtU4+yz6jmNPRfGieYgePhn2NSTdQ6ukWi+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7641
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

On Fri, Nov 14, 2025 at 05:30:36PM -0600, Timur Tabi wrote:
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
> diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
> index 1b98bb47424c..6ac9593504db 100644
> --- a/drivers/gpu/nova-core/firmware/booter.rs
> +++ b/drivers/gpu/nova-core/firmware/booter.rs
> @@ -356,14 +356,34 @@ pub(crate) fn new(
>              }
>          };
>  
> +        // There are two versions of Booter, one for Turing/GA100, and another for
> +        // GA102+.  The extraction of the IMEM sections differs between the two
> +        // versions.  Unfortunately, the file names are the same, and the headers
> +        // don't indicate the versions.  The only way to differentiate is by the Chipset.

Some more doc comments and documentation explaining the header structure
would be great.

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

Can write more succinctly:

  imem_sec_load_target: FalconLoadTarget {
      src_start: match chipset > Chipset::GA100  {
          true => app0.offset,
          false => load_hdr.os_code_size,
      },
      dst_start: match chipset > Chipset::GA100 {
          true => 0,
          false => app0.offset,
      
      len: app0.len,                                                                            
  },

> +            },
> +            imem_ns_load_target: if chipset > Chipset::GA100 {
> +                None
> +            } else {
> +                Some(FalconLoadTarget {
> +                    src_start: 0,
> +                    dst_start: load_hdr.os_code_offset,
> +                    len: load_hdr.os_code_size,
> +                })
>              },
> -            // Exists only in the booter image for Turing and GA100
> -            imem_ns_load_target: None,
>              dmem_load_target: FalconLoadTarget {
>                  src_start: load_hdr.os_data_offset,
>                  dst_start: 0,
> @@ -393,7 +413,13 @@ fn brom_params(&self) -> FalconBromParams {
>      }
>  
>      fn boot_addr(&self) -> u32 {
> -        self.imem_sec_load_target.src_start
> +        if let Some(ns_target) = &self.imem_ns_load_target {
> +            // Turing and GA100 - use non-secure load target
> +            ns_target.dst_start
> +        } else {
> +            // GA102+ (Ampere) - use secure load target

s/Ampere/Ampere and later/ ? Also missing period at end of comment, here and
elsewhere.

thanks,

 - Joel

> +            self.imem_sec_load_target.src_start
> +        }
>      }
>  }
>  
> -- 
> 2.51.2
> 

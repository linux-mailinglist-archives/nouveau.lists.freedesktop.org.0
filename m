Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF1AC66C6C
	for <lists+nouveau@lfdr.de>; Tue, 18 Nov 2025 02:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0420910E0C1;
	Tue, 18 Nov 2025 01:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fEQzPaQp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010033.outbound.protection.outlook.com
 [52.101.193.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3273110E0C1
 for <nouveau@lists.freedesktop.org>; Tue, 18 Nov 2025 01:04:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mB8E092bfMYcYO4RylYrzHQqujOw9LghusuKwi03Y/l/KeV7bFYC30rTS7RwBI3pQDShBnL6ABCIK3kwmvSH/1JHhP+uDfLz52AZrIVGm/gKWYycwEh/QiEGeKfcNnHNtCpyUtEFK0jNS8PrXVuFzReSxmsvrpX2icY97MjiJlmBWuMFwtOZmcC4t/Sy5YCUhCWIdD9vDhAtZ0W+zYzFUNKubiTek5aTBCHIoyRHtVPvsUS3P9+fcSn5emXQgEurllFMyVBqFcLv91IlA0MRnDkdy+NKiC1rKCACfs4bIZ2JnXyr6ILJubFVVw/b8msvZb+WB+eh62W7Zi0L/YxCnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYhkxyUdimcmG8yXrxW7yxAXlyJaGzaHzTA+gDNUG8A=;
 b=jXnR0Kbwucd4cwVuQN8XsC4sESHvevkGVhQ5FNc/gVxjhR8OlQwoVRZr9B37jQcvb09retTIeQyWttLuSgJWOw+AwN5emqZyFmTlG2RCoALFC8pmE8CpfIJ0QYNKh8FJHdJF29MqWKtgubs9pnyvoHJH0FuqeSRrn/KQKFbHsXVV8qSCep615HvUOlCPi6reTVyMcFhOpI3zOL5MzvWjHHHo9TeYTMi0HRhLmo/A5vNnaimcMzDQQmIzLto2e1tiSAPRqkTpB/uLcseRQpnRo5ItkpIBgN/ScClU/D+rAeLSZ6WcbKUxPxvoj5HxNRrkq3YXoQSOQyjG+eytnfnVDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYhkxyUdimcmG8yXrxW7yxAXlyJaGzaHzTA+gDNUG8A=;
 b=fEQzPaQpi0gzL2ggqi/CdJGzQb47mNshyoyn7e9/RbNWnjBF0Xk+1j86bC3vWe4Xir/yduXCItMW6cpf5NSzhRINwBohSR5Ot8+uZgiV324yGWzalvjtQMfbJdiEuFYcAVcL3xAl6uH5FBr6EtZR0FqW++nL0tFoTzk4xpO1nXONqYIuLZlqdhG3aAvr+SHFKs7F5bp2WLnUcuRUoG0f8FE2TWbwLVxtTtBAnKyOtrAXM299lkHK28B9cjDOfeT7XVCSDyfyCuIRFejk8kf1QzB+AIDpt1hUXW3ALXLMc6xMcLJ9rNmkS9CW+RFWnwu8zB6OU1poXvuxTBszSqEHGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB5760.namprd12.prod.outlook.com (2603:10b6:510:1d3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Tue, 18 Nov
 2025 01:04:26 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 01:04:26 +0000
Date: Mon, 17 Nov 2025 20:04:24 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
Message-ID: <20251118010424.GA1131446@joelbox2>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-4-ttabi@nvidia.com>
 <20251117223324.GA1094429@joelbox2>
 <57b542d736e22d1bce7143b789e0760c9380aaa3.camel@nvidia.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57b542d736e22d1bce7143b789e0760c9380aaa3.camel@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::13) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: eb431a80-bf01-4b00-cdca-08de263e6b73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FGtG5nAzTv3UKnhP4OFuyW3gZ0RFLJV+0jiyYKXaEZrin0VBqNQEe0zZPv?=
 =?iso-8859-1?Q?pzDP91M48uxIgi8lsTQYZTbcRznS4gNdpIKICm6hDv9pV1SC4l0KN9EVi8?=
 =?iso-8859-1?Q?rwxPQtm5ie4joGXKw8nb4zKWhrzYabm8Y9BchatuIBKcbsw2zEe4gNiWfH?=
 =?iso-8859-1?Q?11kognOaBOibXIO7drbDs7f20IQdMmJofX9A6hO8rW6PZ/nPYmtfeW4r7L?=
 =?iso-8859-1?Q?TqGavvNfFTBCrnBlDWtiufxCWq4Dcsv+p6KdJ6sVLTcFgAOTz47H3EVPBc?=
 =?iso-8859-1?Q?VfP0po11Q9o2cG10nY5uyEP4c4rGqDxvLtqt4Rzymb/bLoGDt7RFWg+7W1?=
 =?iso-8859-1?Q?Cg3oZ0/SvANHbeCUI0LrHaleGQ5cygpkEa0qUe100TMUegEDPCLb0wjZco?=
 =?iso-8859-1?Q?wm0IWp17mV6/Eq/jsK7mENYaINvVlM27elomR4Xl6Aw6IF8myGTh6hDhw2?=
 =?iso-8859-1?Q?FaRqwLNH7tbSCM/ksDpXV62rPvLlhVh+4a0Iy8h/XE6131y6pag4ywh5MF?=
 =?iso-8859-1?Q?2tX07DMCQeQZ4QG9C876QFfQqN6O9C19f3xf8cDc/uY5v9ak1EDo126dwz?=
 =?iso-8859-1?Q?hw5x7EzfuW8l4kHr09l3r8tNxMXaSI83/9pv3I4vEnkH9CwEGEAq8fmyXo?=
 =?iso-8859-1?Q?UFMuOcyWM3VuMAjVE68a0gd56BiGAklsxjrmjOH8Y9vTGQTiYyeaXXGvyU?=
 =?iso-8859-1?Q?aCzmrGtgUh6gOm6c1Ayk8n8jDo/QW4RZcbt4PzJP3OmcwptLaRPBvDp3qf?=
 =?iso-8859-1?Q?uOIs8w0ZlZhM6pU316kzCU1QnDPULo9Ypp+kckxtp6j5UIR4F6xieN8EWP?=
 =?iso-8859-1?Q?k8FrMs7eG1GV4P1mmHqncMPuBo5wKx0vonpsfGsXX/DrnbjUS3SdIeAVii?=
 =?iso-8859-1?Q?JdZ9TOBlu0kFOthkc6cr7jktFQH33FsRaN/2luQEdyVm343H1CACsWdOqn?=
 =?iso-8859-1?Q?LTVhZDx1f7ICsVYvRAP+PXWI83E1QmsNYrXesuh5ZCRk9ZEaAF7mOdynIi?=
 =?iso-8859-1?Q?A50URTLGfgOOKyF4wYs6GSFK/dOvcl+Dv8KlL5lgnAxWoRQ6cDJU7up4OE?=
 =?iso-8859-1?Q?MgOcjQebJ2JHoGNthsLF7wN2JegxsbrmIKvIVuf77AJaFPO+VNERMjtqEg?=
 =?iso-8859-1?Q?y0uZnEM2rFyPzNbJAPymKyADT7nC7H9LOty74N04CqtYShpdQK5uKhVKJC?=
 =?iso-8859-1?Q?/Xczf0AYsXuvxSbRscZZ3RV7gsI2uJoUQUa2CwET541yvCoydwz/y8sVlQ?=
 =?iso-8859-1?Q?+FBSJmtl5mdFWfAi9D2jWj8X4YiN5sj1tg/lUDPOmHTkvDuQhfqPiNd9Sv?=
 =?iso-8859-1?Q?JC1fQsmZrCNxFhmZK2cm4OpdFVya01Xe7zA/Zp/529sB1y/R0vvV/DPvFf?=
 =?iso-8859-1?Q?lX6QEIzXnI1e0NgDWgbLqg8Y3qisje8DmZXEmwAsAPqbVtu1RtO/bG7OeI?=
 =?iso-8859-1?Q?FZcKT0MRBa1yExc/slvqbfF4OEiwaIHLMzKvU88VbY9kaj7plgMejQE6RA?=
 =?iso-8859-1?Q?tCunJnh0xIV3Lo/I36pBAm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gvYKs2kOrrLE1VnnbhQMeVsgtozk6SBSnt971Ls3b3WnsPnMAQ1JK8IBfj?=
 =?iso-8859-1?Q?t6gf0C+MIbK2sw7mKl0HW9cK17eBIKK7QXWVqBdEL/nplhYZont5qr9q3H?=
 =?iso-8859-1?Q?KNrDf4LFh5fVXG5SrlV0l8iFfIQ3MP4zRfbBCu1RUUGAaGK4e4Shg7Bz5d?=
 =?iso-8859-1?Q?lLu4/ip7Jb+eyAgPIt22fgeNdaRtVxa4QQ3O2TZqw6JGuXafSVdFraOjSj?=
 =?iso-8859-1?Q?ZsDzszwFBhwDMEGOGpDLDBnG5xlU+dmmoxnkm4bvV5d2HjZg3J4D46yUE9?=
 =?iso-8859-1?Q?X26BWBQJgz4cP+0gpgRb5ygLZKzpgCcIWni5bpkxxb0GrTDnFWt2use2xs?=
 =?iso-8859-1?Q?BoRVdOH319UDyaZx/eD3f+zVSnjUgADcM46CUA3MVCXV0Dky4Bj9SjoH+B?=
 =?iso-8859-1?Q?SUALBmRKgsv+F1kGG2kuCOCvRoG6mwe/DGek9n6e0bOHfF7psEpPreOD9g?=
 =?iso-8859-1?Q?CT4TFPVFABIXbENMIPv8VAi2OTlhZXFGjBPtBOwZiLYmWhJ70yeubJ2eO/?=
 =?iso-8859-1?Q?3cln2U3dairT/5oAze/9WEUxtZpGLCCi9vCqsi3TUunS9IFeVn6YSH3S7X?=
 =?iso-8859-1?Q?qx59YBBWJRC2pxVnXjkyJYwqufr+lsWESttZGKx39MMF/nC3ah052YYAA1?=
 =?iso-8859-1?Q?uBw3Q0410tF8WqWO4oBENMT/UAekrDQE4u6CbOm9N/LBW0x8j8WJUZRF4E?=
 =?iso-8859-1?Q?e8Ljq41xYAWnrpPZOnPctqtOBXHtzR46WBFxw+h6djoyU9FTIfZyo0cJlU?=
 =?iso-8859-1?Q?D3eWh8gaguJHE0DRlmnVgy/kSWJ+3YvdR9CT6pp0Nmcs57kfO0mcKhLRt8?=
 =?iso-8859-1?Q?D6x2LMzqR6lnrJ261s9kll39F5Byt0sVEQIqNPHkLSS/Z4w+PHRbHywXjt?=
 =?iso-8859-1?Q?CwDySotBmshmCJuV8jqU08FVDCNqiRAYybwB9j6dw94UH7SPO0YHKmFzH1?=
 =?iso-8859-1?Q?jHHzqjP4dH/cOAzjxfq91e1AGh3st4Oqf04PB3f185AuI+PxICteyrHqO2?=
 =?iso-8859-1?Q?U6eim8ZVYxptHgI7Lsl6uXqBMVNznjdv7qu36iCifkoZORDC9bqly1Q4s1?=
 =?iso-8859-1?Q?X4mGm5U1q2t249MEVX14q04Uh2KmQwujBWM3g0Ursu+1McUWGanDE9wewA?=
 =?iso-8859-1?Q?1LGcm13sTXxySVpkr0H+uLrCOoXmQNZNxqVTdBP909TdiMeZV9V2N0kXKV?=
 =?iso-8859-1?Q?3OfTZ8T3CwNXpomJMJHaLGEA/VUGmWVB+xvnYR4nZoRXwmIt5Mb7UKQE6c?=
 =?iso-8859-1?Q?lb7E3RHCSsF/rTsK5xt97eNceqczEHKH3zhVI6YSw5TRf/tEGQ1Xy+snP3?=
 =?iso-8859-1?Q?iJ+UpCDfwm/sBsLjLlR8bNqcqFOzlhIBnLjUFMcQ2EtiVfHUIP65ahQOv9?=
 =?iso-8859-1?Q?53yVFh4dq4LIQMuGHtgrNZ3KZy2qsE584RBS8zAmHGb9KA4vGap0rTBD82?=
 =?iso-8859-1?Q?14/KJqyk90Xm5kpCg+TexRs/ollFd7c0nb494e3+0SlsD58sDTXCAjNRz8?=
 =?iso-8859-1?Q?H7pP6sEV9tsGYg8zezS1MG7sJkHUb9Vomgjm6D/sn4Owbod3inHeIPWWMR?=
 =?iso-8859-1?Q?TmOATrJy3IXSZobvwm94aJKo88qwKw9qPxjJr8pCExFOWrGaXQViqSeZ/o?=
 =?iso-8859-1?Q?lSLR25dswb3I6S2VHfsraq8qMerox9OTXs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb431a80-bf01-4b00-cdca-08de263e6b73
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 01:04:26.6838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ACZI/dn7tGyGuomTu6d6D+o0m4fCspNAQNSZHkVh+GJW+a5wJuEmtRyLm9ee1XHZFnL/sEvlVDOUhAmjUp+4kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5760
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

On Tue, Nov 18, 2025 at 12:52:47AM +0000, Timur Tabi wrote:
[...] 
> > > +
> > >          Ok(Self {
> > > -            imem_sec_load_target: FalconLoadTarget {
> > > -                src_start: app0.offset,
> > > -                dst_start: 0,
> > > -                len: app0.len,
> > > +            imem_sec_load_target: if chipset > Chipset::GA100 {
> > > +                FalconLoadTarget {
> > > +                    src_start: app0.offset,
> > > +                    dst_start: 0,
> > > +                    len: app0.len,
> > > +                }
> > > +            } else {
> > > +                FalconLoadTarget {
> > > +                    src_start: load_hdr.os_code_size,
> > > +                    dst_start: app0.offset,
> > > +                    len: app0.len,
> > > +                }
> > 
> > Can write more succinctly:
> > 
> >   imem_sec_load_target: FalconLoadTarget {
> >       src_start: match chipset > Chipset::GA100  {
> >           true => app0.offset,
> >           false => load_hdr.os_code_size,
> >       },
> >       dst_start: match chipset > Chipset::GA100 {
> >           true => 0,
> >           false => app0.offset,
> >       
> >       len: app0.len,                                                                            
> >   },
> 
> Do we really want to use "match" instead of "if", just because we don't need "else"?

I don't care about the if/else as much as I care about the opportunity to
just specify FalconLoadTarget once instead twice. I think the match here is cleaner for this
snippet, but I am Ok with the if/else as well.

Something like:
   imem_sec_load_target: FalconLoadTarget {
       src_start: if chipset > Chipset::GA100  {
          app0.offset
      } else {
           load_hdr.os_code_size
      },

That would be one more line of code, but pretty much the same.

thanks,

 - Joel



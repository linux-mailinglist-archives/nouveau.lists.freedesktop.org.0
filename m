Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AC12CFBB7
	for <lists+nouveau@lfdr.de>; Sat,  5 Dec 2020 16:22:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25E56E42E;
	Sat,  5 Dec 2020 15:22:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Sat, 05 Dec 2020 08:30:28 UTC
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFF46E3EE
 for <nouveau@lists.freedesktop.org>; Sat,  5 Dec 2020 08:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1607157028;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=m1Fg+2fiuBESw+2cc2tVoewK2JbkdoEe4/+zgiw93hs=;
 b=iTe13PTrHFRBw+0SW2F/vylIcM5RVP29V4N4BbzO0B/po6lk2j8qR3jA
 dq1LBwZKsmGds3HbNcek05dxe6khZvbAov4Uaiqekb2fGJG9s0EEvmw8t
 JW9tsKG5KUCxJ6dcKxIv8UhQmdTwGY8e7V42oSVxxLC7FX4IHLpx5idEt 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: Dt7wjvltwcxpdH0voN6FPSBB/ul/o795btBvdlYX3ybfbPax6ufeIk/mQ7qoStw6cudU6Q7u67
 a44X+P3mTYbUQS9b6NUI9OFHr4KttlnkgLLqozv5bviFIc/qwWgQ0JaKZiNcgB9quXX9uwcJGb
 KpuI6cyND9twmSXJ9Jwjf3gfqgQ6iWAfxRpGQ3uCFDy3FsOUBYBst1x46W7zrvBGHEeLSKVMvA
 5x+GQ2aT5B5KlhYPP3w7sN4r9fXFyeiBwbUeV40Bl8J2NB2ohmQet9aef8DFANkd7+GzTo0hHV
 ofk=
X-SBRS: 5.1
X-MesageID: 32603291
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,395,1599537600"; d="scan'208";a="32603291"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaDhOWlAoAKuLCJgk+FPJ8iJZ8P6ZvNzlKxzoPYWpg1tF0C4y1LiXwY5aN7mSVIMf7svsKwBG/FahQFyUajIP1Mi4hO3HGEX/QT7FBQyiL2S7alT8A8c25xyqDQVzNpv+zPmy+RUAuSASnzqsQs8Dqs5TnEnO4q3AWnwGazbIXlhhYc0FEH5b80oawulTjXAiCXUn2iGdqRypZ69EzgYDjyWsXHLfCF8vhQRJmPANk5em4hVb8H6yEK2fdnpZxm0Ln5RJWixWcF/pzNydPfAjbIrltq68N9YPQm//R/1aQ8ieaknUcrb8oxAKRtbJNFS/oOjVNeJB1ybkBvUcee0Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNTPicD1c6TUeogIRTmzHUxRmZNEBeOptjCqlBr/pYk=;
 b=LIOe9MlT615fWBmZ6QprFKWXVHPwhA2jLIfO4d2xR1Pi+EI9t9GknhanC9jnlcL7r7U9wzYfklIYsfvGGeeGBhyeyulkATPia9FbuVVcAuP/j3ys3onolSF6Y+7xV0Z1csoe4GErlRPgxiA7S9WXnptc+m+YEjC148jE+gi6eCzN9Jtw1VctnasPM8parh2jQtIY3p7MoopwobglZ8q2USeEH4nUumwiiw3/5LlVWq6p8IfE6WAK2JHq/+e2390MVTO7FflP3Y838/DyR9u12DFVbYPU/4I47NrpKKczVXiFGjmYibajNjBsc45NiuS2RcPjKYBdy2gev4HT23/GBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNTPicD1c6TUeogIRTmzHUxRmZNEBeOptjCqlBr/pYk=;
 b=onvq/Q4WShQJ4Uv6Zw11Y7LwSza7w+qIck+qGtuPc42KBWyQt64zW6XQiS0JvCug5b7MayeJ0kl/LD/LBGDosU7AOK9LUhLfGvtJVHvSGrytdWTmpsmNLbDlbicdUWZ10y31swTMK8rYzAqjJyPrBlU+bEb+gZphgEVjsb3ApDU=
Date: Sat, 5 Dec 2020 09:22:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20201205082259.l7fdwfxdvi5xn3kz@Air-de-Roger>
References: <20201106005147.20113-1-rcampbell@nvidia.com>
 <20201106005147.20113-4-rcampbell@nvidia.com> <20201106080322.GE31341@lst.de>
 <a7b8b90c-09b7-2009-0784-908b61f61ef2@nvidia.com>
 <20201109091415.GC28918@lst.de>
 <bbf1f0df-85f3-5887-050e-beb2aad750f2@nvidia.com>
 <20201120200133.GH917484@nvidia.com> <20201202100854.GB7597@lst.de>
Content-Disposition: inline
In-Reply-To: <20201202100854.GB7597@lst.de>
X-ClientProxiedBy: MR2P264CA0130.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 607bbbe9-8aab-45d6-d92b-08d898f703cf
X-MS-TrafficTypeDiagnostic: DM5PR03MB2844:
X-Microsoft-Antispam-PRVS: <DM5PR03MB28442FD523D9E3B91BBE4F2B8FF00@DM5PR03MB2844.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sYE5NZ0+t1ti5Fl5gELn1Zv+gMXxefWNrvyoRnMrSLXxDSfsMO2ILBWU2OtfHH1VB7whrU06ipX8bNKHX5SAIa64zadA4kzjYXSLu6Pwi03YQ3LulU3zozSbJSEmSJeo1BzKN1h0VyG3HnkhNWXhpK2IvIXlg3CkCNpHzjTQlDc1sojzQCnjFMLx3V9QQdbui8mK50vcXfgX+LGIGf15/tREYNBrOnA0YB5xuQh4PjD87VZTH13/GBdS8oxYXdbxwgtphFw/GGBh31MsuNqmcHTNRIEMCOyx4OA+2Zhgg2sFnby9Z3G5npzpBR0UEfjgQVke5/z1lLdYNxfr4Zf3xA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR03MB5608.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(376002)(136003)(366004)(396003)(39860400002)(346002)(66556008)(33716001)(54906003)(6916009)(5660300002)(7416002)(83380400001)(86362001)(4326008)(8676002)(6496006)(956004)(85182001)(8936002)(9686003)(26005)(6666004)(6486002)(316002)(186003)(2906002)(66946007)(66476007)(478600001)(1076003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q0xtd2MxYnEwVEpzV0RtY1JPaTJ1TWJ3SzcwWHEzNXJDdjg1UjRNcVlQY0Jq?=
 =?utf-8?B?WDRTZXZNem9SRWpSYmJwb0JFU1M5a3p3ZHlmVUxIMlZRQlc2b1RMbVowUkZ4?=
 =?utf-8?B?UTA4ZThTWjRKMjJ3MzQ3cklaTkE1aFNwcUxqQ0lQdkxBR1JlZVFYNFBZd2ls?=
 =?utf-8?B?L09udUdPZCtEa2NNZXVENk5YZ3JWRGF3Z1BzK1JrTS9DV0VnY1hNZWNrYlh4?=
 =?utf-8?B?NUtJRGtNWWlaekkrUEhES2FUaTRBVUx1T3JuMXArS3lBdm5ybDJhVndqWjhy?=
 =?utf-8?B?Wnk0cDBSVWhXaHZMSGtNWE9yWDNUUVA2WFd6NlpSSGJxeW04UVJJNzlVa0Jh?=
 =?utf-8?B?aW53K2xWMUJQZWxJT1ZVWHN2blRvZXMxSFJGSS91QXEwTDh0OTRqeS9QV3pv?=
 =?utf-8?B?ek82cS9ZLy9Xbi95TTRPVS9pY3MrbjFGUFd5UHNBY3o2R1R2LzZ4VkdjbEw1?=
 =?utf-8?B?dlVTZmhJSVB0NmJyV0RhNFJJdlJwWGZrbXMrSjEvcU9vNEw1eTdaZS83RjNV?=
 =?utf-8?B?cVR3T0RjcHRSbEtWZW9PVUV2NDJaVnAzZ0VkR3hQNTc4SGtKRWR6ZStSSGFy?=
 =?utf-8?B?VFFMVURqUHdQb2E3TXcrWlY4NHN0bTFYK3BNWk85YXVMT1JKSU9HaUkxbFRh?=
 =?utf-8?B?ZzJqTGtpWVd5VEVpak1VWURHdzFnRjlXL2l6VkdIeE1NZjIwb1FFQXp2TEFv?=
 =?utf-8?B?ZmFBWnA5OHh0em1uVDN2S3ZQODFrdUdLMjhldHdJQ21aaTlrODV0bjZhOEN3?=
 =?utf-8?B?MS9ZQjRERXNTOFZvd3g5QUlpSzZXWGpFZk1IcVZaeHZmdXhxaGtJZmdYQzVo?=
 =?utf-8?B?anFCNHVQME1XT3pHQktZbndQelRuK1kzWWlQY092R3lRZDRoOTJWR1V6TGJG?=
 =?utf-8?B?ckhLeUpqdHVnV3lJSU1OSGp5VDdyazJseHdWbzh3bTJCOGc3R2JjaGZoc0k4?=
 =?utf-8?B?TUkyY2tIOXVpN2pjTjV2T2dzSFozQm1GWGI5VkhsMUJIc0k5UkF3ZngvUmlo?=
 =?utf-8?B?ZTdvdUo1aWFxcWg5VjI1UHh5dkxWK3RUYjN1c2N3clVTSnhSM0ZkWWxTM3VO?=
 =?utf-8?B?NXIrVCtVNWpaTVNncDdaYldPbUNKaXpkNWFNUloxbVA4T3RXQ3JDUjdzWmdr?=
 =?utf-8?B?RWo5WDRRandqN3hOWGx5TFdPUkhoV1ZyY2xOYWlFOGErQ2tHT1NUVTkzVVAy?=
 =?utf-8?B?OXRUeWNDME1EQ0VWTzdjdHMxRzhiLzdxM202WUp6VXR1SDRBaHNmZlNYdFF2?=
 =?utf-8?B?Wk1vS1FCb0pCNnlXK3NJdVRIbTQvMXZJR1Z4bFlIazg4aHh4QVJzRE41djlP?=
 =?utf-8?Q?FkOr3sCT6Ot/zdtFqy6eI6d0ff7Gxa73xq?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2020 08:23:15.9709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 607bbbe9-8aab-45d6-d92b-08d898f703cf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUsR5KYomrrROUr8gqThA8AIeBmymlaxjmdwGBTKBizGD791XWobuUoubln+tVUD+o5I4h+4iEpHBu+dxYs0+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2844
X-OriginatorOrg: citrix.com
X-Mailman-Approved-At: Sat, 05 Dec 2020 15:22:43 +0000
Subject: Re: [Nouveau] [PATCH v3 3/6] mm: support THP migration to device
 private memory
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Yang Shi <yang.shi@linux.alibaba.com>, Jason Gunthorpe <jgg@nvidia.com>,
 nouveau@lists.freedesktop.org, Alistair
 Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-kselftest@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Shuah Khan <shuah@kernel.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Dec 02, 2020 at 11:08:54AM +0100, Christoph Hellwig wrote:
> On Fri, Nov 20, 2020 at 04:01:33PM -0400, Jason Gunthorpe wrote:
> > On Wed, Nov 11, 2020 at 03:38:42PM -0800, Ralph Campbell wrote:
> > 
> > > MEMORY_DEVICE_GENERIC:
> > > Struct pages are created in dev_dax_probe() and represent non-volatile memory.
> > > The device can be mmap()'ed which calls dax_mmap() which sets
> > > vma->vm_flags | VM_HUGEPAGE.
> > > A CPU page fault will result in a PTE, PMD, or PUD sized page
> > > (but not compound) to be inserted by vmf_insert_mixed() which will call either
> > > insert_pfn() or insert_page().
> > > Neither insert_pfn() nor insert_page() increments the page reference
> > > count.
> > 
> > But why was this done? It seems very strange to put a pfn with a
> > struct page into a VMA and then deliberately not take the refcount for
> > the duration of that pfn being in the VMA?
> > 
> > What prevents memunmap_pages() from progressing while VMAs still point
> > at the memory?
> 
> Agreed.  Adding Roger who added MEMORY_DEVICE_GENERIC and the only
> user.

MEMORY_DEVICE_GENERIC is just a rename of the previous
MEMORY_DEVICE_DEVDAX, and seems to be used by the DAX device apart
from Xen?

It's main purpose is to be able to allocate unused physical memory
ranges and have a baking struct page for them, so they can be used to
map foreign memory when running on Xen.

I'm currently on leave and won't be back until the end of the month,
could you please Cc the Xen maintainers if you modify the logic here
in order to make sure it will work for Xen?

Thanks, Roger.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

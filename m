Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF741B835E
	for <lists+nouveau@lfdr.de>; Sat, 25 Apr 2020 04:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C686EBA0;
	Sat, 25 Apr 2020 02:52:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BED3E6E287
 for <nouveau@lists.freedesktop.org>; Mon, 20 Apr 2020 23:27:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DF641FB;
 Mon, 20 Apr 2020 16:27:45 -0700 (PDT)
Received: from [192.168.0.129] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6918F3F73D;
 Mon, 20 Apr 2020 16:27:39 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Will Deacon <will@kernel.org>
References: <1584680057-13753-1-git-send-email-anshuman.khandual@arm.com>
 <1584680057-13753-3-git-send-email-anshuman.khandual@arm.com>
 <20200420210354.GD29998@willie-the-truck>
Message-ID: <78fee884-78fc-6102-1a37-12106dc21336@arm.com>
Date: Tue, 21 Apr 2020 04:57:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200420210354.GD29998@willie-the-truck>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 25 Apr 2020 02:51:59 +0000
Subject: Re: [Nouveau] [PATCH 2/2] mm/thp: Rename pmd_mknotpresent() as
 pmd_mknotvalid()
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
Cc: x86@kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Russell King <linux@armlinux.org.uk>, Steven Rostedt <rostedt@goodmis.org>,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 nouveau@lists.freedesktop.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-snps-arc@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>



On 04/21/2020 02:33 AM, Will Deacon wrote:
> On Fri, Mar 20, 2020 at 10:24:17AM +0530, Anshuman Khandual wrote:
>> pmd_present() is expected to test positive after pmdp_mknotpresent() as the
>> PMD entry still points to a valid huge page in memory. pmdp_mknotpresent()
>> implies that given PMD entry is just invalidated from MMU perspective while
>> still holding on to pmd_page() referred valid huge page thus also clearing
>> pmd_present() test. This creates the following situation which is counter
>> intuitive.
>>
>> [pmd_present(pmd_mknotpresent(pmd)) = true]
>>
>> This renames pmd_mknotpresent() as pmd_mknotvalid() reflecting the helper's
>> functionality more accurately while changing the above mentioned situation
>> as follows. This does not create any functional change.
>>
>> [pmd_present(pmd_mknotvalid(pmd)) = true]
>>
>> This is not applicable for platforms that define own pmdp_invalidate() via
>> __HAVE_ARCH_PMDP_INVALIDATE. Suggestion for renaming came during a previous
>> discussion here.
> 
> Bikeshed alert: maybe pmd_mkinvalid() would be better, given that this is
> a one-trick pony for pmdp_invalidate()?

I had thought about making it pmd_mkinvalid() earlier. But as we were replacing
pmd_mknotpresent(), hence went with similar pattern pmd_mknotvalid() which was
originally suggested by Catalin. There is an existing pte_mknotpresent() in arc
platform as well. I dont have a very strong opinion either way, will be happy
to rename. But then still wondering if we really need to.

> 
> Will
> 
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

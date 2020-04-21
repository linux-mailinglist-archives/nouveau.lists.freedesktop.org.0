Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3C31B8365
	for <lists+nouveau@lfdr.de>; Sat, 25 Apr 2020 04:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491AB6EBA7;
	Sat, 25 Apr 2020 02:52:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B9B526E8A5
 for <nouveau@lists.freedesktop.org>; Tue, 21 Apr 2020 08:09:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B5261FB;
 Tue, 21 Apr 2020 01:09:37 -0700 (PDT)
Received: from [10.163.1.9] (unknown [10.163.1.9])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03BAA3F6CF;
 Tue, 21 Apr 2020 01:09:29 -0700 (PDT)
To: Will Deacon <will@kernel.org>
References: <1584680057-13753-1-git-send-email-anshuman.khandual@arm.com>
 <1584680057-13753-3-git-send-email-anshuman.khandual@arm.com>
 <20200420210354.GD29998@willie-the-truck>
 <78fee884-78fc-6102-1a37-12106dc21336@arm.com>
 <20200421070703.GC14448@willie-the-truck>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <73e2d20a-4009-c2f3-03b7-fcd29d098491@arm.com>
Date: Tue, 21 Apr 2020 13:39:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200421070703.GC14448@willie-the-truck>
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



On 04/21/2020 12:37 PM, Will Deacon wrote:
> On Tue, Apr 21, 2020 at 04:57:26AM +0530, Anshuman Khandual wrote:
>>
>>
>> On 04/21/2020 02:33 AM, Will Deacon wrote:
>>> On Fri, Mar 20, 2020 at 10:24:17AM +0530, Anshuman Khandual wrote:
>>>> pmd_present() is expected to test positive after pmdp_mknotpresent() as the
>>>> PMD entry still points to a valid huge page in memory. pmdp_mknotpresent()
>>>> implies that given PMD entry is just invalidated from MMU perspective while
>>>> still holding on to pmd_page() referred valid huge page thus also clearing
>>>> pmd_present() test. This creates the following situation which is counter
>>>> intuitive.
>>>>
>>>> [pmd_present(pmd_mknotpresent(pmd)) = true]
>>>>
>>>> This renames pmd_mknotpresent() as pmd_mknotvalid() reflecting the helper's
>>>> functionality more accurately while changing the above mentioned situation
>>>> as follows. This does not create any functional change.
>>>>
>>>> [pmd_present(pmd_mknotvalid(pmd)) = true]
>>>>
>>>> This is not applicable for platforms that define own pmdp_invalidate() via
>>>> __HAVE_ARCH_PMDP_INVALIDATE. Suggestion for renaming came during a previous
>>>> discussion here.
>>>
>>> Bikeshed alert: maybe pmd_mkinvalid() would be better, given that this is
>>> a one-trick pony for pmdp_invalidate()?
>>
>> I had thought about making it pmd_mkinvalid() earlier. But as we were replacing
>> pmd_mknotpresent(), hence went with similar pattern pmd_mknotvalid() which was
>> originally suggested by Catalin. There is an existing pte_mknotpresent() in arc
>> platform as well. I dont have a very strong opinion either way, will be happy
>> to rename. But then still wondering if we really need to.
> 
> I just think that having pmdp_invalidate() call pmd_mkinvalid() makes a lot
> of sense and, since this is a pure renaming patch, then that's worth taking
> into consideration.

Sure np, will do.

> 
> If you go with pmd_mkinvalid(), then:
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> Will
> 
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76D81B8357
	for <lists+nouveau@lfdr.de>; Sat, 25 Apr 2020 04:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F9F6EB9E;
	Sat, 25 Apr 2020 02:52:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C436E8C5
 for <nouveau@lists.freedesktop.org>; Tue, 21 Apr 2020 07:07:12 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E98DB206A5;
 Tue, 21 Apr 2020 07:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587452832;
 bh=nSyfKCbkaVtKHCZaeQ7c7Ek5l6MXuMmFCJQlpVuLZfU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NUGOg1mXOuq/6HjHGlurmlbGhycqsLCFz0LK/ZaeGdY21oV5cjw12MYLtLeAPVFbw
 VfFOlg1Z5rWrrgro1MaB35twX1Nt57OaWBkyZtWSW5gWCA7FSq6FKpOboLcPfpRpUG
 9JxWfHvdPYP99brmwfjsmetxSMPBroBpO5dVQfOY=
Date: Tue, 21 Apr 2020 08:07:05 +0100
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <20200421070703.GC14448@willie-the-truck>
References: <1584680057-13753-1-git-send-email-anshuman.khandual@arm.com>
 <1584680057-13753-3-git-send-email-anshuman.khandual@arm.com>
 <20200420210354.GD29998@willie-the-truck>
 <78fee884-78fc-6102-1a37-12106dc21336@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78fee884-78fc-6102-1a37-12106dc21336@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 25 Apr 2020 02:51:58 +0000
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

On Tue, Apr 21, 2020 at 04:57:26AM +0530, Anshuman Khandual wrote:
> 
> 
> On 04/21/2020 02:33 AM, Will Deacon wrote:
> > On Fri, Mar 20, 2020 at 10:24:17AM +0530, Anshuman Khandual wrote:
> >> pmd_present() is expected to test positive after pmdp_mknotpresent() as the
> >> PMD entry still points to a valid huge page in memory. pmdp_mknotpresent()
> >> implies that given PMD entry is just invalidated from MMU perspective while
> >> still holding on to pmd_page() referred valid huge page thus also clearing
> >> pmd_present() test. This creates the following situation which is counter
> >> intuitive.
> >>
> >> [pmd_present(pmd_mknotpresent(pmd)) = true]
> >>
> >> This renames pmd_mknotpresent() as pmd_mknotvalid() reflecting the helper's
> >> functionality more accurately while changing the above mentioned situation
> >> as follows. This does not create any functional change.
> >>
> >> [pmd_present(pmd_mknotvalid(pmd)) = true]
> >>
> >> This is not applicable for platforms that define own pmdp_invalidate() via
> >> __HAVE_ARCH_PMDP_INVALIDATE. Suggestion for renaming came during a previous
> >> discussion here.
> > 
> > Bikeshed alert: maybe pmd_mkinvalid() would be better, given that this is
> > a one-trick pony for pmdp_invalidate()?
> 
> I had thought about making it pmd_mkinvalid() earlier. But as we were replacing
> pmd_mknotpresent(), hence went with similar pattern pmd_mknotvalid() which was
> originally suggested by Catalin. There is an existing pte_mknotpresent() in arc
> platform as well. I dont have a very strong opinion either way, will be happy
> to rename. But then still wondering if we really need to.

I just think that having pmdp_invalidate() call pmd_mkinvalid() makes a lot
of sense and, since this is a pure renaming patch, then that's worth taking
into consideration.

If you go with pmd_mkinvalid(), then:

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

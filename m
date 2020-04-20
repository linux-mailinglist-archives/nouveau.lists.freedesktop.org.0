Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455181B8363
	for <lists+nouveau@lfdr.de>; Sat, 25 Apr 2020 04:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A486EBA3;
	Sat, 25 Apr 2020 02:52:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCAA6E279
 for <nouveau@lists.freedesktop.org>; Mon, 20 Apr 2020 21:04:01 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C73920724;
 Mon, 20 Apr 2020 21:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587416641;
 bh=B6tu4PQYxSMIHwT8IIW2BqLBbquTlTHzD+k7VKRWKiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KLGeSVsaKscXEomFaxLVk4/08pxBFxLmWwvvp/xVS1rq81o2K8P2Bnl1v4kjl/sb2
 XFU86f/Aa7FwnQNCuJpc1uYdan2zLkqza8h9twbemUXWVnnZf6ZvW2IinHp4Lp24AC
 ML8bBjhsBDp85WIi7Pe/U+i6OaK7Z5IAiZJu87jg=
Date: Mon, 20 Apr 2020 22:03:55 +0100
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <20200420210354.GD29998@willie-the-truck>
References: <1584680057-13753-1-git-send-email-anshuman.khandual@arm.com>
 <1584680057-13753-3-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1584680057-13753-3-git-send-email-anshuman.khandual@arm.com>
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

On Fri, Mar 20, 2020 at 10:24:17AM +0530, Anshuman Khandual wrote:
> pmd_present() is expected to test positive after pmdp_mknotpresent() as the
> PMD entry still points to a valid huge page in memory. pmdp_mknotpresent()
> implies that given PMD entry is just invalidated from MMU perspective while
> still holding on to pmd_page() referred valid huge page thus also clearing
> pmd_present() test. This creates the following situation which is counter
> intuitive.
> 
> [pmd_present(pmd_mknotpresent(pmd)) = true]
> 
> This renames pmd_mknotpresent() as pmd_mknotvalid() reflecting the helper's
> functionality more accurately while changing the above mentioned situation
> as follows. This does not create any functional change.
> 
> [pmd_present(pmd_mknotvalid(pmd)) = true]
> 
> This is not applicable for platforms that define own pmdp_invalidate() via
> __HAVE_ARCH_PMDP_INVALIDATE. Suggestion for renaming came during a previous
> discussion here.

Bikeshed alert: maybe pmd_mkinvalid() would be better, given that this is
a one-trick pony for pmdp_invalidate()?

Will
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

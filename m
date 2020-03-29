Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B3B197584
	for <lists+nouveau@lfdr.de>; Mon, 30 Mar 2020 09:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2736E102;
	Mon, 30 Mar 2020 07:22:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EDD476E131
 for <nouveau@lists.freedesktop.org>; Sun, 29 Mar 2020 13:42:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B302231B;
 Sun, 29 Mar 2020 06:42:50 -0700 (PDT)
Received: from [10.163.1.70] (unknown [10.163.1.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5731E3F71F;
 Sun, 29 Mar 2020 06:42:43 -0700 (PDT)
To: linux-mm@kvack.org
References: <1584680057-13753-1-git-send-email-anshuman.khandual@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <2e67f1b8-d196-89e4-aee1-f552db1433a0@arm.com>
Date: Sun, 29 Mar 2020 19:12:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1584680057-13753-1-git-send-email-anshuman.khandual@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:22:22 +0000
Subject: Re: [Nouveau] [PATCH 0/2] mm/thp: Rename pmd_mknotpresent() as
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-snps-arc@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 nouveau@lists.freedesktop.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>



On 03/20/2020 10:24 AM, Anshuman Khandual wrote:
> This series renames pmd_mknotpresent() as pmd_mknotvalid(). Before that it
> drops an existing pmd_mknotpresent() definition from powerpc platform which
> was never required as it defines it's pmdp_invalidate() through subscribing
> __HAVE_ARCH_PMDP_INVALIDATE. This does not create any functional change.
> 
> This rename was suggested by Catalin during a previous discussion while we
> were trying to change the THP helpers on arm64 platform for migration.
> 
> https://patchwork.kernel.org/patch/11019637/
> 
> This series is based on v5.6-rc6.
> 
> Boot tested on arm64 and x86 platforms.
> Built tested on many other platforms including the ones changed here.

Gentle ping, any updates regarding this ?
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

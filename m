Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E85CCAD7AA2
	for <lists+nouveau@lfdr.de>; Thu, 12 Jun 2025 21:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E2C10E18C;
	Thu, 12 Jun 2025 19:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TVg3k6+1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D343F10E166
 for <nouveau@lists.freedesktop.org>; Thu, 12 Jun 2025 19:04:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D085A6116E;
 Thu, 12 Jun 2025 19:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDC4C4CEEA;
 Thu, 12 Jun 2025 19:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749755055;
 bh=6D6BxuzqFc6289gWzxr9MD9k6SduwODZ6NYAWgJEVvE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TVg3k6+1fIFCDCqzj07OpTxgI7rzCORKFJbnqm8GeR9/Oss7I+h/K8zjYgLY7WVC2
 w1+q2edN6g8e8Croaj+1DDwH6LAQMtjnSMyvSJZQSZsUuTEvp0KAXFESX8PacCrgJs
 aM3hbncXgquVHDukx3NmSg6cOb/FLcRQHUlhHwyvNG0pHb532yUDsKwlX0RWY/oQZ3
 Ov6H5FMMYGTeK/p+HkjAExQ3JC4gemnACMbtpztskO8CiI5c/QKFz9RrAEpIYHWD2y
 ISKKCAodFRejkVVX257Qga1XEswstCcv2G8CP5fuaoGIjydsqYgaxXwTvC2YTs8QDZ
 b/EskwBtyvQrA==
Date: Thu, 12 Jun 2025 12:03:47 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Zhenghan Cheng <chengzhenghan@uniontech.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org,
 mario.limonciello@amd.com, yazen.ghannam@amd.com,
 jpoimboe@kernel.org, tony.luck@intel.com, jarkko@kernel.org,
 bhelgaas@google.com, pbonzini@redhat.com, oleg@redhat.com,
 jbaron@akamai.com, ning.sun@intel.com, seanjc@google.com,
 luto@kernel.org, andy@kernel.org, jim.cromie@gmail.com,
 kirill.shutemov@linux.intel.com, hpa@zytor.com,
 pawan.kumar.gupta@linux.intel.com, vkuznets@redhat.com,
 rostedt@goodmis.org, ardb@kernel.org, thomas.lendacky@amd.com,
 nikunj@amd.com, ashish.kalra@amd.com, kees@kernel.org,
 alexandre.chartre@oracle.com, rppt@kernel.org, steve.wahl@hpe.com,
 jirislaby@kernel.org, apatel@ventanamicro.com, bvanassche@acm.org,
 ptsm@linux.microsoft.com, Jonathan.Cameron@huawei.com,
 beata.michalska@arm.com, xin@zytor.com, davydov-max@yandex-team.ru,
 ravi.bangoria@amd.com, joel.granados@kernel.org,
 ffmancera@riseup.net, kprateek.nayak@amd.com,
 akpm@linux-foundation.org, bhe@redhat.com, brgerst@gmail.com,
 coxu@redhat.com, dmaluka@chromium.org, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-sgx@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux.dev,
 tboot-devel@lists.sourceforge.net, nouveau@lists.freedesktop.org,
 linux-coco@lists.linux.dev, xen-devel@lists.xenproject.org,
 Huacai Chen <chenhuacai@loongson.cn>,
 Zhenghan Cheng <your_email@example.com>
Subject: Re: [PATCH] x86: Fix build warnings about export.h
Message-ID: <20250612190347.GB1283@sol>
References: <20250612093228.7655-1-chengzhenghan@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612093228.7655-1-chengzhenghan@uniontech.com>
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

On Thu, Jun 12, 2025 at 05:32:28PM +0800, Zhenghan Cheng wrote:
> After commit a934a57a42f64a4 ("scripts/misc-check:
> check missing #include <linux/export.h> when W=1")
> and commit 7d95680d64ac8e836c ("scripts/misc-check:
> check unnecessary #include <linux/export.h> when W=1"),
> we get some build warnings with W=1,such as:
> 
> arch/x86/coco/sev/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> arch/x86/crypto/aria_aesni_avx2_glue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> arch/x86/kernel/unwind_orc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> arch/x86/kvm/hyperv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> arch/x86/events/intel/core.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
> arch/x86/events/zhaoxin/core.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
> arch/x86/kernel/crash.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
> arch/x86/kernel/devicetree.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
> 
> so fix these build warnings for x86.
> 
> Signed-off-by: "Zhenghan Cheng" <chengzhenghan@uniontech.com>
> Suggested-by: "Huacai Chen" <chenhuacai@loongson.cn>

FYI, I'm planning to handle arch/x86/lib/crc*.c and arch/x86/lib/crypto/.

(Specifically, I'm migrating them to lib/crc/ and lib/crypto/ respectively, and
one of the effects of that is the EXPORT_SYMBOL in arch-specific crc and crypto
library files go away.  The lib/crc/ change is already in linux-next, and
https://lore.kernel.org/r/20250612183852.114878-1-ebiggers@kernel.org adds
<linux/export.h> to all files with EXPORT_SYMBOL in lib/crc/.)

- Eric

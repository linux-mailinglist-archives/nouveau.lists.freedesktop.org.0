Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 790FC4BD307
	for <lists+nouveau@lfdr.de>; Mon, 21 Feb 2022 02:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C41F10E286;
	Mon, 21 Feb 2022 01:12:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A78A10E525;
 Tue, 15 Feb 2022 19:13:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2784BB81C66;
 Tue, 15 Feb 2022 19:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA149C340EB;
 Tue, 15 Feb 2022 19:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644952415;
 bh=aWKfLj+OcuQ7ORm2NzKcSLdWPXwTMvCyCCSlhItZJdc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pb9b+lIl3czsbILZx4JGaHKfxai5nhmkbafSdXIePkm1+42+PtZWRvtnxsIxieHjT
 9ekyHuwvisvcr9fVX07+lClUNa2p0vhktIvKZSAjwuXs2gg0KwuzJxVI1eJwsCEsx9
 QAqj6xuEKLMkpaRxHB9Jbh5UZNn3lhP/U/32rVpI9FJi1e5LJ0Z2HLVW0p7KctTIZB
 uH0ohVDX/Qm561zC5FzYDM+alYJWObfXnSGwWXg348TFcT9AqtFzE3U54RAksJmBj5
 t03G17WjapCI9e95mge26r6O7cubp0cNepLCQdTnroGWEV76h8vqtZwzBmUYMX3S66
 UcWCeciahTo0A==
Date: Tue, 15 Feb 2022 13:21:10 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kees Cook <keescook@chromium.org>
Message-ID: <20220215192110.GA883653@embeddedor>
References: <20220215174743.GA878920@embeddedor>
 <202202151016.C0471D6E@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202202151016.C0471D6E@keescook>
X-Mailman-Approved-At: Mon, 21 Feb 2022 01:12:29 +0000
Subject: Re: [Nouveau] [PATCH][next] treewide: Replace zero-length arrays
 with flexible-array members
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
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 devicetree@vger.kernel.org, target-devel@vger.kernel.org,
 linux-hardening@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-acpi@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-ext4@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-xtensa@linux-xtensa.org,
 mpi3mr-linuxdrv.pdl@broadcom.com, coresight@lists.linaro.org,
 sparmaintainer@unisys.com, linux-um@lists.infradead.org,
 greybus-dev@lists.linaro.org, linux-rpi-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devel@acpica.org, linux-cifs@vger.kernel.org, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com,
 linux-crypto@vger.kernel.org, linux-alpha@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Feb 15, 2022 at 10:17:40AM -0800, Kees Cook wrote:
> On Tue, Feb 15, 2022 at 11:47:43AM -0600, Gustavo A. R. Silva wrote:
> > There is a regular need in the kernel to provide a way to declare
> > having a dynamically sized set of trailing elements in a structure.
> > Kernel code should always use “flexible array members”[1] for these
> > cases. The older style of one-element or zero-length arrays should
> > no longer be used[2].
> > 
> > This code was transformed with the help of Coccinelle:
> > (next-20220214$ spatch --jobs $(getconf _NPROCESSORS_ONLN) --sp-file script.cocci --include-headers --dir . > output.patch)
> > 
> > @@
> > identifier S, member, array;
> > type T1, T2;
> > @@
> > 
> > struct S {
> >   ...
> >   T1 member;
> >   T2 array[
> > - 0
> >   ];
> > };
> 
> These all look trivially correct to me. Only two didn't have the end of
> the struct visible in the patch, and checking those showed them to be
> trailing members as well, so:
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>

I'll add this to my -next tree.

Thanks!
--
Gustavo

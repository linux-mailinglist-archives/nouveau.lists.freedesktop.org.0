Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 065226BD98C
	for <lists+nouveau@lfdr.de>; Thu, 16 Mar 2023 20:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E45910E2AC;
	Thu, 16 Mar 2023 19:50:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871BD10E2AC
 for <nouveau@lists.freedesktop.org>; Thu, 16 Mar 2023 19:50:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA873620FA;
 Thu, 16 Mar 2023 19:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0590BC433EF;
 Thu, 16 Mar 2023 19:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678996239;
 bh=moLvtDcS2t0hYUwb9GPaqpFg5LnXXKhW5777Gh63RF4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=bACMCg7rlfffyva7/AnZ9DFx6GD8gcLpUyR5uwB7d53qst8LAUPe+H0f2WhpORKI3
 frZOtCpHNTUSLCd6mUJ8FWi5Y3ZM3kJJUYXhprnWPcN7mvBb7qQrkJqQUBEuMnjZ1r
 mSox0SsJgEmUs9Bn5rEeA0GPLtRNlp6e3i0w3PdhrFDBp2h4Fy8TYVLtfb7rjX52ov
 c3135VSwyhAxT5n6fecCbGxYJy7tjB3oEGHPBpWOb+eVbPpSYGDhw3ZE3gzuHB8eEq
 bzC0VgB458HEEX2Sr6Bwahm1vBzQOaszWp87nedPgAvUbm8AVozDhAGCeAtf4hABwF
 yE5EjSn6jN8lw==
Date: Thu, 16 Mar 2023 14:50:37 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <20230316195037.GA1849341@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316143122.2377354-1-kherbst@redhat.com>
Subject: Re: [Nouveau] [PATCH] PCI: stop spamming info in quirk_nvidia_hda
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Mar 16, 2023 at 03:31:22PM +0100, Karol Herbst wrote:
> Users kept complaining about those messages and it's a little spammy on
> prime systems so turn it into a debug print.

What is a "prime system"?

I'm a little surprised that users would really care about the message.
But I do see comments like these:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1836308/comments/15
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2002206
that suggest the message happens frequently, maybe if we're resuming
the controller after runtime suspend?

Maybe this should be a pci_info_once() sort of thing?  I think there's
some value in knowing that we're changing the BIOS configuration
outside the purview of a driver, since I assume BIOS had some reason
for hiding the HDA controller.

> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: linux-pci@vger.kernel.org
> Cc: nouveau@lists.freedesktop.org
> Fixes: b516ea586d71 ("PCI: Enable NVIDIA HDA controllers")
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/pci/quirks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 44cab813bf951..b10c77bbe4716 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -5549,7 +5549,7 @@ static void quirk_nvidia_hda(struct pci_dev *gpu)
>  	if (val & BIT(25))
>  		return;
>  
> -	pci_info(gpu, "Enabling HDA controller\n");
> +	pci_dbg(gpu, "Enabling HDA controller\n");
>  	pci_write_config_dword(gpu, 0x488, val | BIT(25));
>  
>  	/* The GPU becomes a multi-function device when the HDA is enabled */
> -- 
> 2.39.2
> 

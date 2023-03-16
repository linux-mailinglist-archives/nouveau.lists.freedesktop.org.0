Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD9C6BD67F
	for <lists+nouveau@lfdr.de>; Thu, 16 Mar 2023 17:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E16F10ED9C;
	Thu, 16 Mar 2023 16:55:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 867 seconds by postgrey-1.36 at gabe;
 Thu, 16 Mar 2023 16:55:56 UTC
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [IPv6:2a01:37:3000::53df:4ef0:0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B72010ED89
 for <nouveau@lists.freedesktop.org>; Thu, 16 Mar 2023 16:55:56 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id 9B19D2800C911;
 Thu, 16 Mar 2023 17:41:27 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 907DD2D3D9; Thu, 16 Mar 2023 17:41:27 +0100 (CET)
Date: Thu, 16 Mar 2023 17:41:27 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <20230316164127.GA5476@wunner.de>
References: <20230316143122.2377354-1-kherbst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316143122.2377354-1-kherbst@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
> 
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: linux-pci@vger.kernel.org
> Cc: nouveau@lists.freedesktop.org
> Fixes: b516ea586d71 ("PCI: Enable NVIDIA HDA controllers")
> Signed-off-by: Karol Herbst <kherbst@redhat.com>

Could you provide Link: tags to bugzillas or mailing list messages
of those complaints so that the sentence sounds a little less like
hand-waving?

The point of the message is that if users see adverse effects as a
result of exposing the hidden HDA controller, they get a hint in
dmesg as to the cause.  Hopefully the existence of such adverse
effects can be ruled out by now.

Thanks,

Lukas

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

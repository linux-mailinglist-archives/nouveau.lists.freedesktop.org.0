Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 026CF13832C
	for <lists+nouveau@lfdr.de>; Sat, 11 Jan 2020 20:33:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D101D6E2B6;
	Sat, 11 Jan 2020 19:32:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391516E33C;
 Wed,  8 Jan 2020 20:29:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 12:29:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,411,1571727600"; d="scan'208";a="223034363"
Received: from djiang5-desk3.ch.intel.com ([143.182.136.137])
 by orsmga006.jf.intel.com with ESMTP; 08 Jan 2020 12:29:09 -0800
To: Krzysztof Kozlowski <krzk@kernel.org>, Richard Henderson
 <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jiri Slaby
 <jirislaby@gmail.com>, Nick Kossifidis <mickflemm@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jon Mason <jdmason@kudzu.us>,
 Allen Hubbe <allenbh@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-ntb@googlegroups.com, virtualization@lists.linux-foundation.org,
 linux-arch@vger.kernel.org
References: <20200108200528.4614-1-krzk@kernel.org>
 <20200108200528.4614-4-krzk@kernel.org>
From: Dave Jiang <dave.jiang@intel.com>
Message-ID: <64659f77-f807-7c8e-7595-731056c73bf4@intel.com>
Date: Wed, 8 Jan 2020 13:29:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200108200528.4614-4-krzk@kernel.org>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 11 Jan 2020 19:32:28 +0000
Subject: Re: [Nouveau] [PATCH v2 3/9] ntb: intel: Constify ioreadX() iomem
 argument (as in generic implementation)
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>



On 1/8/20 1:05 PM, Krzysztof Kozlowski wrote:
> The ioreadX() helpers have inconsistent interface.  On some architectures
> void *__iomem address argument is a pointer to const, on some not.
> 
> Implementations of ioreadX() do not modify the memory under the address
> so they can be converted to a "const" version for const-safety and
> consistency among architectures.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Dave Jiang <dave.jiang@intel.com>

> 
> ---
> 
> Changes since v1:
> 1. Add Geert's review.
> ---
>   drivers/ntb/hw/intel/ntb_hw_gen1.c  | 2 +-
>   drivers/ntb/hw/intel/ntb_hw_gen3.h  | 2 +-
>   drivers/ntb/hw/intel/ntb_hw_intel.h | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/ntb/hw/intel/ntb_hw_gen1.c b/drivers/ntb/hw/intel/ntb_hw_gen1.c
> index bb57ec239029..9202502a9787 100644
> --- a/drivers/ntb/hw/intel/ntb_hw_gen1.c
> +++ b/drivers/ntb/hw/intel/ntb_hw_gen1.c
> @@ -1202,7 +1202,7 @@ int intel_ntb_peer_spad_write(struct ntb_dev *ntb, int pidx, int sidx,
>   			       ndev->peer_reg->spad);
>   }
>   
> -static u64 xeon_db_ioread(void __iomem *mmio)
> +static u64 xeon_db_ioread(const void __iomem *mmio)
>   {
>   	return (u64)ioread16(mmio);
>   }
> diff --git a/drivers/ntb/hw/intel/ntb_hw_gen3.h b/drivers/ntb/hw/intel/ntb_hw_gen3.h
> index 75fb86ca27bb..d1455f24ec99 100644
> --- a/drivers/ntb/hw/intel/ntb_hw_gen3.h
> +++ b/drivers/ntb/hw/intel/ntb_hw_gen3.h
> @@ -91,7 +91,7 @@
>   #define GEN3_DB_TOTAL_SHIFT		33
>   #define GEN3_SPAD_COUNT			16
>   
> -static inline u64 gen3_db_ioread(void __iomem *mmio)
> +static inline u64 gen3_db_ioread(const void __iomem *mmio)
>   {
>   	return ioread64(mmio);
>   }
> diff --git a/drivers/ntb/hw/intel/ntb_hw_intel.h b/drivers/ntb/hw/intel/ntb_hw_intel.h
> index e071e28bca3f..3c0a5a2da241 100644
> --- a/drivers/ntb/hw/intel/ntb_hw_intel.h
> +++ b/drivers/ntb/hw/intel/ntb_hw_intel.h
> @@ -102,7 +102,7 @@ struct intel_ntb_dev;
>   struct intel_ntb_reg {
>   	int (*poll_link)(struct intel_ntb_dev *ndev);
>   	int (*link_is_up)(struct intel_ntb_dev *ndev);
> -	u64 (*db_ioread)(void __iomem *mmio);
> +	u64 (*db_ioread)(const void __iomem *mmio);
>   	void (*db_iowrite)(u64 db_bits, void __iomem *mmio);
>   	unsigned long			ntb_ctl;
>   	resource_size_t			db_size;
> 
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

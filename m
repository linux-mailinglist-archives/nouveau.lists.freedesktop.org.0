Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3F94E86AA
	for <lists+nouveau@lfdr.de>; Sun, 27 Mar 2022 09:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBED10E157;
	Sun, 27 Mar 2022 07:44:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D1610E193
 for <nouveau@lists.freedesktop.org>; Thu, 24 Mar 2022 18:03:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6347761A78;
 Thu, 24 Mar 2022 18:03:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA14C340F0;
 Thu, 24 Mar 2022 18:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648145021;
 bh=t4qj3yzjpmPxrk9bbLyU8usx0IFZLTWW+/9wIEcE8T0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RyuBJrVfvGAO3I+jdGpD3wWjzHZ5BPFyIqWkxNU+ZGEMVRx7okKrAVg0PHdIgXy4E
 j4cvG8KokWZHeHXK0v8HaHHhcoisqdch4CPoA+WYVrKKai6xags4j49GUPqZZ6xnEB
 vX/rIS8hBuibENDX1LmjivHy2I6Qh8ZIvogvzXRALHN4kltJcr6V23dr2ZqJgOU6mP
 TD93ffV9fwme715cdPhGHRTErYTO3HZf9IkAexYWpInnigQvrxwRqgDcZRUpt8BBf8
 0zasG5ShtBezkzkb66iOesP0vxz0bNxkuOcwbWqujbYehvDg4uxsOffNUk+FMD/dgV
 IsMlJ1z61ezEw==
Date: Thu, 24 Mar 2022 20:03:37 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <YjyyeUEAo+1Kob5v@unreal>
References: <20220316192010.19001-1-rdunlap@infradead.org>
 <20220316192010.19001-4-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220316192010.19001-4-rdunlap@infradead.org>
X-Mailman-Approved-At: Sun, 27 Mar 2022 07:44:03 +0000
Subject: Re: [Nouveau] [PATCH 3/9] net: mlx5: eliminate anonymous
 module_init & module_exit
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
Cc: x86@kernel.org, Andy Lutomirski <luto@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 nouveau@lists.freedesktop.org, Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Valentina Manea <valentina.manea.m@gmail.com>,
 Krzysztof Opasiak <k.opasiak@samsung.com>, Eli Cohen <eli@mellanox.com>,
 netdev@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-scsi@vger.kernel.org,
 linux-rdma@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org,
 Jakub Kicinski <kuba@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Joachim Fritschi <jfritschi@freenet.de>,
 Felipe Balbi <felipe.balbi@linux.intel.com>, Amit Shah <amit@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 linux-block@vger.kernel.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Jussi Kivilinna <jussi.kivilinna@mbnet.fi>,
 virtualization@lists.linux-foundation.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Igor Kotrasinski <i.kotrasinsk@samsung.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Mar 16, 2022 at 12:20:04PM -0700, Randy Dunlap wrote:
> Eliminate anonymous module_init() and module_exit(), which can lead to
> confusion or ambiguity when reading System.map, crashes/oops/bugs,
> or an initcall_debug log.
> 
> Give each of these init and exit functions unique driver-specific
> names to eliminate the anonymous names.
> 
> Example 1: (System.map)
>  ffffffff832fc78c t init
>  ffffffff832fc79e t init
>  ffffffff832fc8f8 t init
> 
> Example 2: (initcall_debug log)
>  calling  init+0x0/0x12 @ 1
>  initcall init+0x0/0x12 returned 0 after 15 usecs
>  calling  init+0x0/0x60 @ 1
>  initcall init+0x0/0x60 returned 0 after 2 usecs
>  calling  init+0x0/0x9a @ 1
>  initcall init+0x0/0x9a returned 0 after 74 usecs
> 
> Fixes: e126ba97dba9 ("mlx5: Add driver for Mellanox Connect-IB adapters")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Eli Cohen <eli@mellanox.com>
> Cc: Saeed Mahameed <saeedm@nvidia.com>
> Cc: netdev@vger.kernel.org
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: linux-rdma@vger.kernel.org
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/main.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>

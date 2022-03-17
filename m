Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C85154E86AB
	for <lists+nouveau@lfdr.de>; Sun, 27 Mar 2022 09:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D4D10E227;
	Sun, 27 Mar 2022 07:44:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F8C10EAFC
 for <nouveau@lists.freedesktop.org>; Thu, 17 Mar 2022 15:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=ThAyvdoG1U35K2Hzsm1O2USOWq/3qlMrhSaUoYHrsOs=; b=F6Vs/65oeZV/y3wN6Bw/M7u1FQ
 5O+4lQTnS32R0VfdvOK1oVjLmv61tBR4yMMjN/NVDsOnHzoBbLMjP382aAGEyJMaumvolGSgA+m71
 1Ehmx8UPj/GCllYWg+tBYociITo9JftToXJThRJBZ9nw2p07B62DgVCik4yzpt77Z8S9KNWcKP8vq
 3tLkrgPZtcMac/dncj65oYGZ4SvtO6CK7F7u84MgNbC6goRbCxod26J//CJV7WZO58VGV5QhSn55l
 /KYfPXjDju0sdq2JANUCt29NuoEjYNFSGZB5nEbrQ97N+XXeTVv8WhJJ+KmWXn+usTtelySDGt3Ln
 87L6gQCw==;
Received: from [54.239.6.186] (helo=freeip.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUsLq-0075ta-2M; Thu, 17 Mar 2022 15:47:46 +0000
Message-ID: <f7b858bb438d1979c1f092e105e0db4c7af47758.camel@infradead.org>
From: Amit Shah <amit@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Date: Thu, 17 Mar 2022 16:47:42 +0100
In-Reply-To: <20220316192010.19001-3-rdunlap@infradead.org>
References: <20220316192010.19001-1-rdunlap@infradead.org>
 <20220316192010.19001-3-rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 27 Mar 2022 07:44:03 +0000
Subject: Re: [Nouveau] [PATCH 2/9] virtio_console: eliminate anonymous
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
 virtualization@lists.linux-foundation.org,
 Krzysztof Opasiak <k.opasiak@samsung.com>, Eli Cohen <eli@mellanox.com>,
 netdev@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "H. Peter
 Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Jozsef Kadlecsik <kadlec@netfilter.org>,
 coreteam@netfilter.org, Jakub Kicinski <kuba@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Joachim Fritschi <jfritschi@freenet.de>,
 Felipe Balbi <felipe.balbi@linux.intel.com>, Amit Shah <amit@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 =?UTF-8?Q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 linux-block@vger.kernel.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Jussi Kivilinna <jussi.kivilinna@mbnet.fi>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jens Axboe <axboe@kernel.dk>,
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Igor Kotrasinski <i.kotrasinsk@samsung.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, 2022-03-16 at 12:20 -0700, Randy Dunlap wrote:
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
> Fixes: 31610434bc35 ("Virtio console driver")
> Fixes: 7177876fea83 ("virtio: console: Add ability to remove module")
> Signed-off-by: Randy Dunlap <
> rdunlap@infradead.org
> >
> Cc: Amit Shah <
> amit@kernel.org
> >
> Cc: 
> virtualization@lists.linux-foundation.org
> 
> Cc: Arnd Bergmann <
> arnd@arndb.de
> >
> Cc: Greg Kroah-Hartman <
> gregkh@linuxfoundation.org
> >
> ---
>  drivers/char/virtio_console.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Amit Shah <amit@kernel.org>

I don't think the Fixes-by really applies here, though - we don't
really want to push this into stable, nor do we want any automated
tools to pick this up because of that tag..

		Amit


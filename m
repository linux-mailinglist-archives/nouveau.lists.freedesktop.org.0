Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A319C4E86A4
	for <lists+nouveau@lfdr.de>; Sun, 27 Mar 2022 09:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B4B10E173;
	Sun, 27 Mar 2022 07:44:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D3710E4A3
 for <nouveau@lists.freedesktop.org>; Sun, 20 Mar 2022 12:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647777900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dluyFNWHj0wdqGZD9WiZi8hb8qI80pWjkbX+xynrT7U=;
 b=NatXzc0l1hN+DWDEjPhDLQWVCskvBWypGy0/f3JsM9la9Fem8I1WVXP33pw+FTDZ8EuMdk
 ecThVAuHL7OiXJFuy4MV+aaotNm88zM6FWkAPaVh3A77efiyU6Zz2Qk1S062nUElNwFZ3i
 XJRCrJqBaQxcHKASe9+UIymvmIj7i/Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-ZujNMW1CMzSjgr4X-jh2mA-1; Sun, 20 Mar 2022 08:04:59 -0400
X-MC-Unique: ZujNMW1CMzSjgr4X-jh2mA-1
Received: by mail-ed1-f72.google.com with SMTP id
 s7-20020a508dc7000000b0040f29ccd65aso7388073edh.1
 for <nouveau@lists.freedesktop.org>; Sun, 20 Mar 2022 05:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dluyFNWHj0wdqGZD9WiZi8hb8qI80pWjkbX+xynrT7U=;
 b=Zpd9MqM4TbJpJM8YXaum+Aa/3W6Z/x0MZTFQTleEeemEMGUipuAcukBoflMhYPVXmh
 IvNtmD4vbDMkdjyS01dJOif+jPbzVuWlR1N+Qs56H3eoAnXhqE6sV+IElMWBm4kjjB4V
 hndrhr0ZScFKSpSvK2JCqwTUyM+rbrcFCNuPQWRkVn6VvK6oqZoxBBOoPRjFYICDT4XY
 ZkqG7fz8036nmh0uSC/9SV9TNsqn6cW+FgiFsXp/8yaW+h6jqMSnf/SipTZ2HNTeIpe1
 gvdJD281qaEi5sXNJgqnKf0vnKaQMwJJKhO0C6r2DY5TXfSN+JOUIq0Vw9G71X4dnAKc
 F5PQ==
X-Gm-Message-State: AOAM532xijsYpOFku0Vhz0CzrXRD7ntCQ0Qf7F+VX4i4vNOdF+JTbOqq
 CAtpXMat4UcUTu4oyqIKPNRHor8ax4JUH9z4e/Ttpb0PnmnVsFFE8lHLs2fv6E98LTjrQRadwvr
 n7oYMRmeEHKhU3Zrp9Ly39mmYRg==
X-Received: by 2002:a05:6402:40c5:b0:418:e73c:a1ab with SMTP id
 z5-20020a05640240c500b00418e73ca1abmr18517045edb.52.1647777898070; 
 Sun, 20 Mar 2022 05:04:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfAQhzmlNy6q9yY+EnFX+2g1gYETe+axmQh3kzhVOc32at9/0TqUx+j50nzMAK4FS++1BWlA==
X-Received: by 2002:a05:6402:40c5:b0:418:e73c:a1ab with SMTP id
 z5-20020a05640240c500b00418e73ca1abmr18517008edb.52.1647777897820; 
 Sun, 20 Mar 2022 05:04:57 -0700 (PDT)
Received: from redhat.com ([2.55.132.0]) by smtp.gmail.com with ESMTPSA id
 27-20020a17090600db00b006df6b34d9b8sm5854831eji.211.2022.03.20.05.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 05:04:57 -0700 (PDT)
Date: Sun, 20 Mar 2022 08:04:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20220320080438-mutt-send-email-mst@kernel.org>
References: <20220316192010.19001-1-rdunlap@infradead.org>
 <20220316192010.19001-3-rdunlap@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20220316192010.19001-3-rdunlap@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
 Peter Zijlstra <peterz@infradead.org>, nouveau@lists.freedesktop.org,
 Jason Wang <jasowang@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Valentina Manea <valentina.manea.m@gmail.com>,
 Krzysztof Opasiak <k.opasiak@samsung.com>, Eli Cohen <eli@mellanox.com>,
 netdev@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Leon Romanovsky <leon@kernel.org>,
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
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Igor Kotrasinski <i.kotrasinsk@samsung.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Mar 16, 2022 at 12:20:03PM -0700, Randy Dunlap wrote:
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
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Amit Shah <amit@kernel.org>
> Cc: virtualization@lists.linux-foundation.org
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


If this is done tree-wide, it's ok to do it for virtio too.

Acked-by: Michael S. Tsirkin <mst@redhat.com>

No real opinion on whether it's a good idea.


> ---
>  drivers/char/virtio_console.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> --- lnx-517-rc8.orig/drivers/char/virtio_console.c
> +++ lnx-517-rc8/drivers/char/virtio_console.c
> @@ -2245,7 +2245,7 @@ static struct virtio_driver virtio_rproc
>  	.remove =	virtcons_remove,
>  };
>  
> -static int __init init(void)
> +static int __init virtio_console_init(void)
>  {
>  	int err;
>  
> @@ -2280,7 +2280,7 @@ free:
>  	return err;
>  }
>  
> -static void __exit fini(void)
> +static void __exit virtio_console_fini(void)
>  {
>  	reclaim_dma_bufs();
>  
> @@ -2290,8 +2290,8 @@ static void __exit fini(void)
>  	class_destroy(pdrvdata.class);
>  	debugfs_remove_recursive(pdrvdata.debugfs_dir);
>  }
> -module_init(init);
> -module_exit(fini);
> +module_init(virtio_console_init);
> +module_exit(virtio_console_fini);
>  
>  MODULE_DESCRIPTION("Virtio console driver");
>  MODULE_LICENSE("GPL");


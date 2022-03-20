Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0944E86AD
	for <lists+nouveau@lfdr.de>; Sun, 27 Mar 2022 09:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5846710E257;
	Sun, 27 Mar 2022 07:44:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A1610E352
 for <nouveau@lists.freedesktop.org>; Sun, 20 Mar 2022 12:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647777877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pfT/FhM65DQKRvRUzD2KeWz3oDwCgvpb4tTTJtJbjgQ=;
 b=PDFQFf5V5N/hF/Sd/ykFFccAhPnqIFWsuIG2hdZIdiJflWUEAiFTGd4MFPNKBUTtOv7Uuc
 OGm9lPIpzcidFPlnv2McAR3pIzR4eHcNPqCAvWijxjPKxgM3kgVYZzrti3VRyAtMDGk3xm
 Tmd0iljTnx/BmMzoz7BDUQPN+JOxnHw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-EO6-qct6O4eD1LOiTupCFA-1; Sun, 20 Mar 2022 08:04:34 -0400
X-MC-Unique: EO6-qct6O4eD1LOiTupCFA-1
Received: by mail-ej1-f72.google.com with SMTP id
 mm20-20020a170906cc5400b006dfec7725f3so659345ejb.15
 for <nouveau@lists.freedesktop.org>; Sun, 20 Mar 2022 05:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pfT/FhM65DQKRvRUzD2KeWz3oDwCgvpb4tTTJtJbjgQ=;
 b=NsPtBH4aHEfqxm2HK9GKjV3tWrQtJai6r32+ZBtdE1DJvVmKuQGE/uLXVKhB7oY+Cu
 L05QV5PCQM3r0onU21LpA9XM/ouLmU/2qedB5Ug6aXMO66ftNGQtCdPSdgpcYOgXZ+jY
 +QU6C3Ya2XDFshNjPlEReE3T6KFqkGEzNCdHluYR+V46L+rl90FOZGlMyMlmwAoJlxzo
 LsQ9ovEq4lHoqxVII9GcK7XSwgsYKhwCUGyF/JO7dRurudFs0RRcL7ihrP5CEaS339f3
 WVVrBkwPW3Ew3wwnOnovQh8WQnX8Ar+3r1CUI1JeX4nyb1ICCHCyZifBUGzutw3exjPa
 r4YQ==
X-Gm-Message-State: AOAM530YZ02QYX1/WSgIRHTiChmMCgND0cPa7UDdZZS5YszXRveOmGQg
 l9XI/7fBa8VAtXrhQ0G9yAzarsLu+AHmPhoMsmvHYVJyRGjQomdd/vuBZOuXz66/KrVpyWnHwx5
 xt2hoDx1S0nP90qsucCscwdC2VQ==
X-Received: by 2002:a17:907:9706:b0:6db:566a:4408 with SMTP id
 jg6-20020a170907970600b006db566a4408mr16470474ejc.374.1647777873699; 
 Sun, 20 Mar 2022 05:04:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx89ppvPKr6BvvjBnbbPf3CkRgoqozB02ZyScIP5D34LakZNdud2DzXyDuKhCsgHIy5z//Zgg==
X-Received: by 2002:a17:907:9706:b0:6db:566a:4408 with SMTP id
 jg6-20020a170907970600b006db566a4408mr16470444ejc.374.1647777873440; 
 Sun, 20 Mar 2022 05:04:33 -0700 (PDT)
Received: from redhat.com ([2.55.132.0]) by smtp.gmail.com with ESMTPSA id
 gb3-20020a170907960300b006dfafbb4ba4sm3340411ejc.83.2022.03.20.05.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 05:04:32 -0700 (PDT)
Date: Sun, 20 Mar 2022 08:04:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20220320080414-mutt-send-email-mst@kernel.org>
References: <20220316192010.19001-1-rdunlap@infradead.org>
 <20220316192010.19001-6-rdunlap@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20220316192010.19001-6-rdunlap@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Sun, 27 Mar 2022 07:44:03 +0000
Subject: Re: [Nouveau] [PATCH 5/9] virtio-scsi: eliminate anonymous
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

On Wed, Mar 16, 2022 at 12:20:06PM -0700, Randy Dunlap wrote:
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
> Fixes: 4fe74b1cb051 ("[SCSI] virtio-scsi: SCSI driver for QEMU based virtual machines")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
> Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> Cc: linux-scsi@vger.kernel.org
> Cc: virtualization@lists.linux-foundation.org



If this is done tree-wide, it's ok to do it for virtio too.

Acked-by: Michael S. Tsirkin <mst@redhat.com>

No real opinion on whether it's a good idea.


> ---
>  drivers/scsi/virtio_scsi.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> --- lnx-517-rc8.orig/drivers/scsi/virtio_scsi.c
> +++ lnx-517-rc8/drivers/scsi/virtio_scsi.c
> @@ -988,7 +988,7 @@ static struct virtio_driver virtio_scsi_
>  	.remove = virtscsi_remove,
>  };
>  
> -static int __init init(void)
> +static int __init virtio_scsi_init(void)
>  {
>  	int ret = -ENOMEM;
>  
> @@ -1020,14 +1020,14 @@ error:
>  	return ret;
>  }
>  
> -static void __exit fini(void)
> +static void __exit virtio_scsi_fini(void)
>  {
>  	unregister_virtio_driver(&virtio_scsi_driver);
>  	mempool_destroy(virtscsi_cmd_pool);
>  	kmem_cache_destroy(virtscsi_cmd_cache);
>  }
> -module_init(init);
> -module_exit(fini);
> +module_init(virtio_scsi_init);
> +module_exit(virtio_scsi_fini);
>  
>  MODULE_DEVICE_TABLE(virtio, id_table);
>  MODULE_DESCRIPTION("Virtio SCSI HBA driver");


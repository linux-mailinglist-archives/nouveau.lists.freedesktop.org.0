Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F10384E8698
	for <lists+nouveau@lfdr.de>; Sun, 27 Mar 2022 09:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D8D10E046;
	Sun, 27 Mar 2022 07:44:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DD410EADC
 for <nouveau@lists.freedesktop.org>; Thu, 17 Mar 2022 03:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647487568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v2SLUI2o5WSRk9a3lKvJBCeORiM/sUU5CpB7omPJTl4=;
 b=AnK5gI8OF/Wbub4qLHzMhUX2C7+Ev013qW94yFvxeULCN/hZOkpVtxAll1BngHb/4aagZ9
 RE0CcSKao7azWofPPwjmpAk2ZYQ3VmrI5G8gzYouQr3bNi3zxjj8m7nfsdVY7vVwRNLlK0
 RfT1ieSRPyrFhJxW0K57dkxvUXJK3Bo=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-x-_bP3xKPd-UyhEr4ZyCZQ-1; Wed, 16 Mar 2022 23:26:06 -0400
X-MC-Unique: x-_bP3xKPd-UyhEr4ZyCZQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 x3-20020a05651c104300b00247ebe980b7so1609049ljm.11
 for <nouveau@lists.freedesktop.org>; Wed, 16 Mar 2022 20:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v2SLUI2o5WSRk9a3lKvJBCeORiM/sUU5CpB7omPJTl4=;
 b=bYkpdFjBOkjnlBZtFv8an5oXEdwjm3FwomjhxzRfwmV6LdbdmLKCcFDMu9QVppZnH3
 xD85jfIt1ohetKKbYSY110R5Uy0qeTlPKzjsuqzZ8UDn9Hi7Jkj9lygnnRi0WhgMXBTy
 BmWHs+jCzVADJHka9XD5GdwUCVhAuf4B0bOZ7srGG/IaMfQiedJr5UW2b5Q9xsfzQZ5x
 gPWZPYJorsl4OdhSju6N0KtrNYlsu+13NvxDgbJ+eEJRi8CGREmQ4jjtHyFM3vSJMBG0
 nWdWkg/cw+0XdlGz8oEcihGg57Y9JpmUA9keI7ehg6Ar7HQuWIht56uhtuLwJcitdndJ
 YTbg==
X-Gm-Message-State: AOAM530l2TrMnPq8JB8fFnhB66ihtBGjztyWbZwD4vClcrVWZu285IZ4
 nlYw4DEl8mVIR0FE2RaN5Ff+d0oTLi/WMBFyxCZXB5dEZNxQypj25WyLlSzjcCouiBmztMD1Z6/
 sz6p/XRi8YU8kpvBtfVk6Gx5K6E9K4XuFe/fgKyVVKw==
X-Received: by 2002:ac2:4189:0:b0:448:bc2b:e762 with SMTP id
 z9-20020ac24189000000b00448bc2be762mr1484732lfh.471.1647487564794; 
 Wed, 16 Mar 2022 20:26:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXgM3TrKtjE8JRO+JLQ4gZHrItL2DfPkyIFRVyKVrsUjNu6z7Jg/bAU90mtxG6avLG14+uPzJmzqIeygxmack=
X-Received: by 2002:ac2:4189:0:b0:448:bc2b:e762 with SMTP id
 z9-20020ac24189000000b00448bc2be762mr1484712lfh.471.1647487564603; Wed, 16
 Mar 2022 20:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220316192010.19001-1-rdunlap@infradead.org>
 <20220316192010.19001-6-rdunlap@infradead.org>
In-Reply-To: <20220316192010.19001-6-rdunlap@infradead.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 17 Mar 2022 11:25:53 +0800
Message-ID: <CACGkMEsX4bS+wmmOE=L5COZxsdFCZmbLTnCe4fZs58MZRx+tQQ@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: the arch/x86 maintainers <x86@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, nouveau@lists.freedesktop.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Valentina Manea <valentina.manea.m@gmail.com>,
 Krzysztof Opasiak <k.opasiak@samsung.com>, Eli Cohen <eli@mellanox.com>,
 netdev <netdev@vger.kernel.org>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Leon Romanovsky <leon@kernel.org>,
 RDMA mailing list <linux-rdma@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org,
 Jakub Kicinski <kuba@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Joachim Fritschi <jfritschi@freenet.de>,
 Felipe Balbi <felipe.balbi@linux.intel.com>, Amit Shah <amit@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 linux-block@vger.kernel.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Jussi Kivilinna <jussi.kivilinna@mbnet.fi>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jens Axboe <axboe@kernel.dk>,
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Florian Westphal <fw@strlen.de>, linux-kernel <linux-kernel@vger.kernel.org>,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Igor Kotrasinski <i.kotrasinsk@samsung.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 3:24 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
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

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  drivers/scsi/virtio_scsi.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> --- lnx-517-rc8.orig/drivers/scsi/virtio_scsi.c
> +++ lnx-517-rc8/drivers/scsi/virtio_scsi.c
> @@ -988,7 +988,7 @@ static struct virtio_driver virtio_scsi_
>         .remove = virtscsi_remove,
>  };
>
> -static int __init init(void)
> +static int __init virtio_scsi_init(void)
>  {
>         int ret = -ENOMEM;
>
> @@ -1020,14 +1020,14 @@ error:
>         return ret;
>  }
>
> -static void __exit fini(void)
> +static void __exit virtio_scsi_fini(void)
>  {
>         unregister_virtio_driver(&virtio_scsi_driver);
>         mempool_destroy(virtscsi_cmd_pool);
>         kmem_cache_destroy(virtscsi_cmd_cache);
>  }
> -module_init(init);
> -module_exit(fini);
> +module_init(virtio_scsi_init);
> +module_exit(virtio_scsi_fini);
>
>  MODULE_DEVICE_TABLE(virtio, id_table);
>  MODULE_DESCRIPTION("Virtio SCSI HBA driver");
>


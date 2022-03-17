Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A0D4E869E
	for <lists+nouveau@lfdr.de>; Sun, 27 Mar 2022 09:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735DC10E13D;
	Sun, 27 Mar 2022 07:44:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F4910ECDD
 for <nouveau@lists.freedesktop.org>; Thu, 17 Mar 2022 08:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647506783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sVx9DgD8AwAJ8+xHbwqIFqUi1dP3yjGM90jTXU92h6o=;
 b=Stt1w64ygRrI4MRvGG0Q82JnK6LQQ0gv2D3EC0zPArgmA9eA6WZvpYLqrW3Zwzu74TJGzs
 pewqhnq8+QEMegzh9IPNNYB3RaQUUANUVzJkGCuCOiZz5x96BWpNbAnBPmNTDWwXxBXOHT
 xEpJwnmJdsTTUWfERK1Nl/y9EHGl57E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-7I8ftN2EOIe68vrg6AndoA-1; Thu, 17 Mar 2022 04:46:20 -0400
X-MC-Unique: 7I8ftN2EOIe68vrg6AndoA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5987B1C03385;
 Thu, 17 Mar 2022 08:46:18 +0000 (UTC)
Received: from localhost (unknown [10.39.194.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FB7153CF;
 Thu, 17 Mar 2022 08:46:13 +0000 (UTC)
Date: Thu, 17 Mar 2022 08:46:12 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <YjL1VK4F53hKntam@stefanha-x1.localdomain>
References: <20220316192010.19001-1-rdunlap@infradead.org>
 <20220316192010.19001-6-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3AeFxmP0HGbN94e3"
Content-Disposition: inline
In-Reply-To: <20220316192010.19001-6-rdunlap@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Cc: x86@kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
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
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
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


--3AeFxmP0HGbN94e3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2022 at 12:20:06PM -0700, Randy Dunlap wrote:
> Eliminate anonymous module_init() and module_exit(), which can lead to
> confusion or ambiguity when reading System.map, crashes/oops/bugs,
> or an initcall_debug log.
>=20
> Give each of these init and exit functions unique driver-specific
> names to eliminate the anonymous names.
>=20
> Example 1: (System.map)
>  ffffffff832fc78c t init
>  ffffffff832fc79e t init
>  ffffffff832fc8f8 t init
>=20
> Example 2: (initcall_debug log)
>  calling  init+0x0/0x12 @ 1
>  initcall init+0x0/0x12 returned 0 after 15 usecs
>  calling  init+0x0/0x60 @ 1
>  initcall init+0x0/0x60 returned 0 after 2 usecs
>  calling  init+0x0/0x9a @ 1
>  initcall init+0x0/0x9a returned 0 after 74 usecs
>=20
> Fixes: 4fe74b1cb051 ("[SCSI] virtio-scsi: SCSI driver for QEMU based virt=
ual machines")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
> Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> Cc: linux-scsi@vger.kernel.org
> Cc: virtualization@lists.linux-foundation.org
> ---
>  drivers/scsi/virtio_scsi.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> --- lnx-517-rc8.orig/drivers/scsi/virtio_scsi.c
> +++ lnx-517-rc8/drivers/scsi/virtio_scsi.c
> @@ -988,7 +988,7 @@ static struct virtio_driver virtio_scsi_
>  	.remove =3D virtscsi_remove,
>  };
> =20
> -static int __init init(void)
> +static int __init virtio_scsi_init(void)
>  {
>  	int ret =3D -ENOMEM;
> =20
> @@ -1020,14 +1020,14 @@ error:
>  	return ret;
>  }
> =20
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
> =20
>  MODULE_DEVICE_TABLE(virtio, id_table);
>  MODULE_DESCRIPTION("Virtio SCSI HBA driver");
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--3AeFxmP0HGbN94e3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIy9VQACgkQnKSrs4Gr
c8geUQgAw2TOHcSEnWK4BJz/IELyWnu6TzVbAIIgDLtl/bUwEsgSwAljdB7zw8K/
6MBcR6ner6oRCLk6Vx0ltNqrAeaxRZOAPqnj1uBP+FZ13in/KYZNz4XkdVZpRbDj
Kqgko1egvrgmbZlvwbRA15UnNntchizS8VfXd45jyGUFLD/zl1JvIKGDVU31vt7i
ZLPUWxMdPG2LwGpgBmTEQnX9LQbK0/d2+f8AEnMAzn1SmIKp8ZgCTYwQrpuD/1xU
eqYoCjQVhNAk7kwkL3XeL/1m0d3b+UVvNRIGaEQBo2Ia8ZJcub7kua6KFb3wfYyK
AQM+SWYvzoTl9ws3BUL4BqsEgEItBA==
=iao2
-----END PGP SIGNATURE-----

--3AeFxmP0HGbN94e3--


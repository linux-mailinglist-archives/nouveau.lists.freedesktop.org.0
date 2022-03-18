Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00584E86A3
	for <lists+nouveau@lfdr.de>; Sun, 27 Mar 2022 09:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72ADB10E125;
	Sun, 27 Mar 2022 07:44:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE0510E2BB
 for <nouveau@lists.freedesktop.org>; Fri, 18 Mar 2022 22:45:58 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 h16-20020a4a6f10000000b00320507b9ccfso11886270ooc.7
 for <nouveau@lists.freedesktop.org>; Fri, 18 Mar 2022 15:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ekiD2sX45IwGk6wtsqdwxLttTAGZcGccRjZl1i6g1JA=;
 b=dMDapo5gWo0mYQwoT0A/aOZqMdPyZSCOVsL5zPGffJvLJZp0AfN2E9xdlck/nSLv/N
 hEsSe5KNbjsmefIhgIIv1yDVHMP+6YIgd44fW9U2d/c1Akfns382n70WbM/10yIkuHjZ
 SUNIZp82WOT2MEcG49QwDBCrffF4++Gcu4CkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ekiD2sX45IwGk6wtsqdwxLttTAGZcGccRjZl1i6g1JA=;
 b=LH3hGx+wm8Kh1sZgQ08ZeTkyfpcHGefhN0H5B06VmSpZTniLoHUeSjFpuSBi24zVaA
 Spt54QBIE6eb2lMV0TfbFyppgLf7vuGdnavYk0q4heqb6y81fzkByFL9BMDDKY1kyJGr
 KvSktzu/1IA53V1RY79N8n/pIBBF4k+vuLJu3r91CZrlnuhe1Bl+w9/vW/qdlhh86vld
 XSz4SSNH4TdDVvHATSmJXizxBd7bkVlmaahjaEwmCzANrolWpbNeo5Yz/xK4j1mHEr/A
 2QlSgHggzfCIke98ViO/61VG4m/PsTHup5qi53BTIOj7PbCJ1xxcvepaIrM0NijeeUJT
 FTMw==
X-Gm-Message-State: AOAM531sXE2+ldM4Iw4Feg1VgPseIHML9O/xhlzypdGGwNORsCoQ9XAM
 J9cJu0EVuMIdA63arMALTs0o2g==
X-Google-Smtp-Source: ABdhPJziihDBziDyTkE7iKcLTBW6BUUFUpCgkLWdsk/9MySxxcozoxXb4xoR4U6FbxLxPWes+cEMkA==
X-Received: by 2002:a05:6820:814:b0:322:b1b2:2456 with SMTP id
 bg20-20020a056820081400b00322b1b22456mr3591951oob.0.1647643557718; 
 Fri, 18 Mar 2022 15:45:57 -0700 (PDT)
Received: from [192.168.1.128] ([71.205.29.0])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a056830244c00b005ad233e0ba3sm4330223otr.48.2022.03.18.15.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 15:45:57 -0700 (PDT)
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20220316192010.19001-1-rdunlap@infradead.org>
 <20220316192010.19001-8-rdunlap@infradead.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <282f4857-7b4f-810e-af0e-e9ca8129c7fc@linuxfoundation.org>
Date: Fri, 18 Mar 2022 16:45:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220316192010.19001-8-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 27 Mar 2022 07:44:03 +0000
Subject: Re: [Nouveau] [PATCH 7/9] usb: usbip: eliminate anonymous
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
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
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

On 3/16/22 1:20 PM, Randy Dunlap wrote:
> Eliminate anonymous module_init() and module_exit(), which can lead to
> confusion or ambiguity when reading System.map, crashes/oops/bugs,
> or an initcall_debug log.
> 
> Give each of these init and exit functions unique driver-specific
> names to eliminate the anonymous names.
> 
> Example 1: (System.map)
>   ffffffff832fc78c t init
>   ffffffff832fc79e t init
>   ffffffff832fc8f8 t init
> 
> Example 2: (initcall_debug log)
>   calling  init+0x0/0x12 @ 1
>   initcall init+0x0/0x12 returned 0 after 15 usecs
>   calling  init+0x0/0x60 @ 1
>   initcall init+0x0/0x60 returned 0 after 2 usecs
>   calling  init+0x0/0x9a @ 1
>   initcall init+0x0/0x9a returned 0 after 74 usecs
> 
> Fixes: 80fd9cd52de6 ("usbip: vudc: Add VUDC main file")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Krzysztof Opasiak <k.opasiak@samsung.com>
> Cc: Igor Kotrasinski <i.kotrasinsk@samsung.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Valentina Manea <valentina.manea.m@gmail.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> ---
>   drivers/usb/usbip/vudc_main.c |    8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> --- lnx-517-rc8.orig/drivers/usb/usbip/vudc_main.c
> +++ lnx-517-rc8/drivers/usb/usbip/vudc_main.c
> @@ -28,7 +28,7 @@ static struct platform_driver vudc_drive
>   
>   static struct list_head vudc_devices = LIST_HEAD_INIT(vudc_devices);
>   
> -static int __init init(void)
> +static int __init vudc_init(void)
>   {
>   	int retval = -ENOMEM;
>   	int i;
> @@ -86,9 +86,9 @@ cleanup:
>   out:
>   	return retval;
>   }
> -module_init(init);
> +module_init(vudc_init);
>   
> -static void __exit cleanup(void)
> +static void __exit vudc_cleanup(void)
>   {
>   	struct vudc_device *udc_dev = NULL, *udc_dev2 = NULL;
>   
> @@ -103,7 +103,7 @@ static void __exit cleanup(void)
>   	}
>   	platform_driver_unregister(&vudc_driver);
>   }
> -module_exit(cleanup);
> +module_exit(vudc_cleanup);
>   
>   MODULE_DESCRIPTION("USB over IP Device Controller");
>   MODULE_AUTHOR("Krzysztof Opasiak, Karol Kosik, Igor Kotrasinski");
> 

Thanks for fixing this.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

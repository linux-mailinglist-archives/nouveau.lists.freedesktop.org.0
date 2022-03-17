Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6EA4E86B5
	for <lists+nouveau@lfdr.de>; Sun, 27 Mar 2022 09:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D280890D3;
	Sun, 27 Mar 2022 07:44:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61C710E253
 for <nouveau@lists.freedesktop.org>; Thu, 17 Mar 2022 16:11:40 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id n18so4844996plg.5
 for <nouveau@lists.freedesktop.org>; Thu, 17 Mar 2022 09:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:in-reply-to:references:subject:message-id:date
 :mime-version:content-transfer-encoding;
 bh=wywg4x91ht1wDsZE8LDgwKs/937jDdBiI3aoJq8Icig=;
 b=EcRFu47wdTKbqMSAq17bN6l3fW68je9I7sz6dNGS5tKD2WRbtx22XzizUZtR0qkyAQ
 QWP1OHwCDN5A0Nw0t3Q7qmd76Q7jNga+edrTyslT2xibkPds1nD37wWbuAnO8SwFuhrO
 gsVcYZtwJfnoFR7QpeZ53g8ha9BP7vQeAQagIeRfmuB8NZSh871Oy/O22T8GKZQsso7+
 GAqKZ5LuYXbJaI8VOrspWlTrq9NYT2zp8TS48/UvpIibmW0S8anvsp+TLqAO1q5KW6Bh
 lxRLQvTEz/3EMFmPsbBbDBLIo1E7GTCaZssTwBenfG227MP1XIuXr1IbCZbQ1ApUnFqh
 aueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
 :message-id:date:mime-version:content-transfer-encoding;
 bh=wywg4x91ht1wDsZE8LDgwKs/937jDdBiI3aoJq8Icig=;
 b=GWk4+IGMbelcJqaVKAQT7WkQcAQdeqDiPKHq21GLYHSzoVgg+2w7Yxt5+4fAflH5lG
 ZS+FR5zh90wge0pktNkDP8nZI8cNUCAvr6DUB1A3NO3/1yri9GeG0lNSJcj2ptGk1d+4
 2ixAYCKqOJWYFAB8/GZcDllRLyLsU+r16dDpbdOAce7lugDCkBX6vijh2v9+DoPQ9wKF
 kIS3m8LScJbLjLROz7MJqiedTfdI5Lf+hHW7sutaY9dvtuAEG2yuLikna4/iVWoeD8zR
 fvRSiQO1WsaVFGvEBp6QgSQepuWjcRv+zI3shWzq89HOWiblvg2AEK1N3DZlMCsFeqaL
 1LAA==
X-Gm-Message-State: AOAM530Zc8DM4t/j4mGuJ+Q/e7vBMB9IA85X74Z2p1UNbRXz2UyO8gET
 pOnXEvimRd9VEnc8uXr7ygERbQ==
X-Google-Smtp-Source: ABdhPJzujChC6izQDJEHNAPYk2A2y6Fs/ty0Hxcz37xAtsWb7B2FaolAnh/R0gH50blU6B7YVSPE4w==
X-Received: by 2002:a17:902:7613:b0:151:6e1c:c49c with SMTP id
 k19-20020a170902761300b001516e1cc49cmr5906213pll.109.1647533499805; 
 Thu, 17 Mar 2022 09:11:39 -0700 (PDT)
Received: from [127.0.1.1] ([2620:10d:c090:400::5:d2fd])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a056a00088a00b004f7ceff389esm7702590pfj.152.2022.03.17.09.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 09:11:39 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220316192010.19001-1-rdunlap@infradead.org>
References: <20220316192010.19001-1-rdunlap@infradead.org>
Message-Id: <164753349550.89091.10994175450707575992.b4-ty@kernel.dk>
Date: Thu, 17 Mar 2022 10:11:35 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 27 Mar 2022 07:44:03 +0000
Subject: Re: [Nouveau] (subset) [PATCH 0/9] treewide: eliminate anonymous
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
Cc: Joachim Fritschi <jfritschi@freenet.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, nouveau@lists.freedesktop.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Eli Cohen <eli@mellanox.com>, Valentina Manea <valentina.manea.m@gmail.com>,
 virtualization@lists.linux-foundation.org,
 Krzysztof Opasiak <k.opasiak@samsung.com>, "H. Peter Anvin" <hpa@zytor.com>,
 netdev@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org,
 Jussi Kivilinna <jussi.kivilinna@mbnet.fi>, Jakub Kicinski <kuba@kernel.org>,
 Jason Wang <jasowang@redhat.com>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Felipe Balbi <felipe.balbi@linux.intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Amit Shah <amit@kernel.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 linux-block@vger.kernel.org, Pekka Paalanen <ppaalanen@gmail.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>,
 Leon Romanovsky <leon@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Igor Kotrasinski <i.kotrasinsk@samsung.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, 16 Mar 2022 12:20:01 -0700, Randy Dunlap wrote:
> There are a number of drivers that use "module_init(init)" and
> "module_exit(exit)", which are anonymous names and can lead to
> confusion or ambiguity when reading System.map, crashes/oops/bugs,
> or an initcall_debug log.
> 
> Give each of these init and exit functions unique driver-specific
> names to eliminate the anonymous names.
> 
> [...]

Applied, thanks!

[1/9] virtio_blk: eliminate anonymous module_init & module_exit
      commit: bcfe9b6cbb4438b8c1cc4bd475221652c8f9301b

Best regards,
-- 
Jens Axboe



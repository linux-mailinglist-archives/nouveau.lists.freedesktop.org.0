Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8C21F8548
	for <lists+nouveau@lfdr.de>; Sat, 13 Jun 2020 22:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8B96E45F;
	Sat, 13 Jun 2020 20:54:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 2864 seconds by postgrey-1.36 at gabe;
 Sat, 09 May 2020 11:57:41 UTC
Received: from omr1.cc.vt.edu (omr1.cc.ipv6.vt.edu
 [IPv6:2607:b400:92:8300:0:c6:2117:b0e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DC289F4F
 for <nouveau@lists.freedesktop.org>; Sat,  9 May 2020 11:57:41 +0000 (UTC)
Received: from mr5.cc.vt.edu (mr5.cc.vt.edu
 [IPv6:2607:b400:92:8400:0:72:232:758b])
 by omr1.cc.vt.edu (8.14.4/8.14.4) with ESMTP id 049B9ugJ017497
 for <nouveau@lists.freedesktop.org>; Sat, 9 May 2020 07:09:56 -0400
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mr5.cc.vt.edu (8.14.7/8.14.7) with ESMTP id 049B9pLA019641
 for <nouveau@lists.freedesktop.org>; Sat, 9 May 2020 07:09:56 -0400
Received: by mail-qt1-f198.google.com with SMTP id n22so5011127qtp.15
 for <nouveau@lists.freedesktop.org>; Sat, 09 May 2020 04:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:mime-version
 :content-transfer-encoding:date:message-id;
 bh=vIjUaVr8lXgICZvNCCHOLX8uh9Z0/aUAOCq842hnMgE=;
 b=V9HKjsQSQQimbkk42P84XiQn/xcJXe8s3sp3ie9uUs4fOvni2tUwDMeKQOUqbycPhJ
 DnIwnioAX1o6fISjsTysoKjLkkDyfwhw7uWg8vcIjDhzsN22oDKxdgYfh1hg4qIdEioz
 IVG0VrvGp8twOwrPpMOoqG5Ks9QUMaFuJcugDYBk0FE4bQouq4RabHf2PecIWzbN2/M6
 7UK/q/GeKOmbo1JUld/Vb9TtVMxK7WVYcVZ+kfPL4LDMSXaHGKI7+YwvfofywFlm2gvC
 iPYW4tcJvpr+CxK/QE8UnSLp4yZvWI2AHaynzXLEbNEMGiXYptoyVwPdgusrgVMmoX+L
 xVyQ==
X-Gm-Message-State: AGi0PuZljFFib9gaw2CnRtqwAdHjWcgNoBIry4S9rfUnCng2rDGr9ftH
 sliB4yHC22LA+VQT4WmQ4hR15SMaMBOivGw9lC4OuvrgARuxNQvseaAdnMGh+1bd9LKNIT5Trvy
 qZq8wLkS16lawTlZcgKHSAO0cSbpHSGq5swWW
X-Received: by 2002:a37:7786:: with SMTP id s128mr7164215qkc.497.1589022590816; 
 Sat, 09 May 2020 04:09:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypLc8IvWBaSGDhyMTl5B9gxpmnXDY7zrvRffUZM1qewb4/r7Sxa5/smmEBjIDGRf7TUUf6kwyw==
X-Received: by 2002:a37:7786:: with SMTP id s128mr7164185qkc.497.1589022590368; 
 Sat, 09 May 2020 04:09:50 -0700 (PDT)
Received: from turing-police ([2601:5c0:c001:c9e1::359])
 by smtp.gmail.com with ESMTPSA id 10sm4316594qtp.4.2020.05.09.04.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 04:09:49 -0700 (PDT)
From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?="
 <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Christoph Hellwig <hch@lst.de>
Mime-Version: 1.0
Date: Sat, 09 May 2020 07:09:48 -0400
Message-ID: <17362.1589022588@turing-police>
X-Mailman-Approved-At: Sat, 13 Jun 2020 20:53:54 +0000
Subject: [Nouveau] linux-next 20200508 - build failure in kernel/resource.c
 w/ SPARSEMEM=n
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0126067196=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0126067196==
Content-Type: multipart/signed; boundary="==_Exmh_1589022587_4501P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit

--==_Exmh_1589022587_4501P
Content-Type: text/plain; charset=us-ascii

So I did a 'make allmodconfig' and then a 'make' on an RPi4 ARM box, and it
decided that CONFIG_SPARSEMEM=n was OK (so an include of linux/mmzone.h doesn't
define some needed values).

The offending code in resource.c is wrapped in a #ifdef CONFIG_DEVICE_PRIVATE,
which throws a whinge during 'make menuconfig' or 'make allmodconfig':

WARNING: unmet direct dependencies detected for DEVICE_PRIVATE
  Depends on [n]: ZONE_DEVICE [=n]
  Selected by [m]:
  - DRM_NOUVEAU_SVM [=y] && HAS_IOMEM [=y] && DRM_NOUVEAU [=m] && MMU [=y] && STAGING [=y]

after which I end up with CONFIG_DEVICE_PRIVATE=y in the .config file.

make menuconfig tells me:
Symbol: ZONE_DEVICE [=n]
   Type  : bool
   Defined at mm/Kconfig:779
     Prompt: Device memory (pmem, HMM, etc...) hotplug support
     Depends on: MEMORY_HOTPLUG [=n] && MEMORY_HOTREMOVE [=n] && SPARSEMEM_VMEMMAP [=n] && ARCH_HAS_PTE_DEVMAP [=n]
     Location:
   (1) -> Memory Management options
   Selects: XARRAY_MULTI [=n]

Pretty obviously a Kconfig whoops, but I have no idea what the proper Kconfig
fix is for this..

May be related to:

commit 0092908d16c604b8207c2141ec64b0fa4473bb03
Author: Christoph Hellwig <hch@lst.de>
Date:   Wed Jun 26 14:27:06 2019 +0200

    mm: factor out a devm_request_free_mem_region helper

which added the #ifdef CONFIG_DEVICE_PRIVATE code in question, except that's a
pretty old commit...  The only thing I'm sure of is that DEVICE_PRIVATE=y and
SPARSEMEM=n blows up. :)

  CC      kernel/resource.o
In file included from ./include/linux/cache.h:5,
                 from ./include/linux/printk.h:9,
                 from ./include/linux/kernel.h:15,
                 from ./include/asm-generic/bug.h:19,
                 from ./arch/arm/include/asm/bug.h:60,
                 from ./include/linux/bug.h:5,
                 from ./include/linux/mmdebug.h:5,
                 from ./include/linux/gfp.h:5,
                 from ./include/linux/slab.h:15,
                 from kernel/resource.c:17:
kernel/resource.c: In function '__request_free_mem_region':
kernel/resource.c:1653:28: error: 'PA_SECTION_SHIFT' undeclared (first use in this function); did you mean 'SECTION_SHIFT'?
  size = ALIGN(size, 1UL << PA_SECTION_SHIFT);
                            ^~~~~~~~~~~~~~~~
./include/uapi/linux/kernel.h:11:47: note: in definition of macro '__ALIGN_KERNEL_MASK'
 #define __ALIGN_KERNEL_MASK(x, mask) (((x) + (mask)) & ~(mask))
                                               ^~~~
./include/linux/kernel.h:33:22: note: in expansion of macro '__ALIGN_KERNEL'
 #define ALIGN(x, a)  __ALIGN_KERNEL((x), (a))
                      ^~~~~~~~~~~~~~
kernel/resource.c:1653:9: note: in expansion of macro 'ALIGN'
  size = ALIGN(size, 1UL << PA_SECTION_SHIFT);
         ^~~~~
kernel/resource.c:1653:28: note: each undeclared identifier is reported only once for each function it appears in
  size = ALIGN(size, 1UL << PA_SECTION_SHIFT);
                            ^~~~~~~~~~~~~~~~
./include/uapi/linux/kernel.h:11:47: note: in definition of macro '__ALIGN_KERNEL_MASK'
 #define __ALIGN_KERNEL_MASK(x, mask) (((x) + (mask)) & ~(mask))
                                               ^~~~
./include/linux/kernel.h:33:22: note: in expansion of macro '__ALIGN_KERNEL'
 #define ALIGN(x, a)  __ALIGN_KERNEL((x), (a))
                      ^~~~~~~~~~~~~~
kernel/resource.c:1653:9: note: in expansion of macro 'ALIGN'
  size = ALIGN(size, 1UL << PA_SECTION_SHIFT);
         ^~~~~
In file included from ./include/asm-generic/bug.h:19,
                 from ./arch/arm/include/asm/bug.h:60,
                 from ./include/linux/bug.h:5,
                 from ./include/linux/mmdebug.h:5,
                 from ./include/linux/gfp.h:5,
                 from ./include/linux/slab.h:15,
                 from kernel/resource.c:17:
kernel/resource.c:1654:48: error: 'MAX_PHYSMEM_BITS' undeclared (first use in this function); did you mean 'MAX_UINSN_BYTES'?
  end = min_t(unsigned long, base->end, (1UL << MAX_PHYSMEM_BITS) - 1);
                                                ^~~~~~~~~~~~~~~~
./include/linux/kernel.h:848:40: note: in definition of macro '__typecheck'
   (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                                        ^
./include/linux/kernel.h:872:24: note: in expansion of macro '__safe_cmp'
  __builtin_choose_expr(__safe_cmp(x, y), \
                        ^~~~~~~~~~
./include/linux/kernel.h:940:27: note: in expansion of macro '__careful_cmp'
 #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
                           ^~~~~~~~~~~~~
kernel/resource.c:1654:8: note: in expansion of macro 'min_t'
  end = min_t(unsigned long, base->end, (1UL << MAX_PHYSMEM_BITS) - 1);
        ^~~~~
./include/linux/kernel.h:872:2: error: first argument to '__builtin_choose_expr' not a constant
  __builtin_choose_expr(__safe_cmp(x, y), \
  ^~~~~~~~~~~~~~~~~~~~~
./include/linux/kernel.h:940:27: note: in expansion of macro '__careful_cmp'
 #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
                           ^~~~~~~~~~~~~
kernel/resource.c:1654:8: note: in expansion of macro 'min_t'
  end = min_t(unsigned long, base->end, (1UL << MAX_PHYSMEM_BITS) - 1);
        ^~~~~
make[1]: *** [scripts/Makefile.build:273: kernel/resource.o] Error 1
make: *** [Makefile:1726: kernel] Error 2


--==_Exmh_1589022587_4501P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBXraPewdmEQWDXROgAQJVZQ//ZMYAfRDOaGeRcZmhKpgaMq3MR3P7L5Aa
w4TzHp31ZVyuGt7Tb9o7WZRYlgPHPQoBqWUbI0ZL5Ev80E//7g+fXQqxrPtpUGGR
LAyOaQ/adybmzSTW79V1Yf2tTIfBwqRQ/WnYQkXl3azERaU62sAGETWoFyVfAspo
kEBKh07eWfhTk2e0Gh2BQzNw0215kh9pyEhnkDizYkUe9yx/wMBSwrBpO6s3xTCx
/qJmwzs8VvXE482CAL5qcyzZAr+A8cnWhIzi9tLQHT2hDu+LSY2jENHpvY18fUMr
nRZtx4oNwz6rW7s7CQMX0QB/yo1ZIahJzGbzOM7Pm+fcMR+uj6THFRj4sElu/bqY
u/d+dDYj1x7GbBenCiK06lGLHnM0RThzLSKQblGCy93B9hQSJFx5vtmxH/asb7uU
qUh0F12kGZ9iVBQkEhhcxMtf8mGOAIdGZtqf+wvG1vPIWywf4V0pIIOW4gEk3/RP
KFlM0/GqulJzCvM1I1t5vufM19vJxcz5W20HldN1y1+zyWL6vw7KpUesHp2342oj
uRij4XiNEgI5W+dyb5XSJIwvIlTBuKu6JC4dAU19vAbN9sY8Ot5fMmwp6Z8gLX1k
c0PMIOewx6jKfsg6vJQEV/zy9SMaMM7Tp9ePDkzyAyXYDLzVRhUSCg2HuIeVCHRt
6xH7VQNFUvg=
=t/Th
-----END PGP SIGNATURE-----

--==_Exmh_1589022587_4501P--

--===============0126067196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0126067196==--

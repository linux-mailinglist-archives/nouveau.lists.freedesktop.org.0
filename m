Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2351658A284
	for <lists+nouveau@lfdr.de>; Thu,  4 Aug 2022 22:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA74FA70EF;
	Thu,  4 Aug 2022 20:42:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE02B11A4B3;
 Thu, 21 Jul 2022 18:13:14 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id f3so1003038uaq.2;
 Thu, 21 Jul 2022 11:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rtGx22uyrHDomoEloAfFSZ99P8sIGqAWG3uOblTYlXI=;
 b=IWf6faJYZdghU6Xjl/DsIwUuSUQIMMvCsl6b2xfd/BIdRSacTLTdo+TenzLfq409EX
 EZ/bEgPL4d1LKZOf7UxQLBJVD4vXhLcFoPna6U7gPUZUIU00c6lopz0j0rSciamXFaqE
 rpMerjuxpehjuGH3wLrB97K5roY2Y/iHLScJl4hJm15H2sfbdXfhHbPmJQfNjAYTlzRE
 4Ce98M0fWtjMUAn+Y5Zon8shvjlKfa3YBFPTsXVf0fX47igTBSrO5S9epIk+W5YqfVXf
 Nth4faq7aXZZ6kZ9cromLV+Ppmbdn//KQpVQMdR1wBEjLBJ9pUUh90Mtrl6b2MTcX3Nz
 oJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rtGx22uyrHDomoEloAfFSZ99P8sIGqAWG3uOblTYlXI=;
 b=nBiB23JSCfy7TtGLiAA2o+Ry4o6AlAVUJ8Pxzn11PaTGXOdkkbq4rzZtx0zsmp+mcn
 fK/agzoiuKPCATeNFB5GuUWW1WD+K4LQ6EqN7fmO6583GQNkHRwXFU/a88wBppfHCLHp
 nCf5QvWcAmotq4tyztXpdx9MJlxYH6KXbxmj0PJDNwhrQ8lSLjbaiBXjDQW+jKp3XBBc
 fdqZ4P6aZF7GoapHHhEFsKKb7CnR0BuqNG1X4Pxh9v28CsbdZ0LUv4Mi9qet/6P5LBz9
 KzFp5UoPkVcAH22RJW+D/Azc9Q82VS5FQvli2SSXiUDNjTydpKspDQkZZ0OVxuT1Yq6o
 p6Dw==
X-Gm-Message-State: AJIora9y8kq7DYdM5Z3SVWfTnmXysarOJTnXml/KlqNnqtqclbjL5VcD
 HsIYcEXIHVjy0F2E5RQ/rws1eJpmuDRWPNG/SZw=
X-Google-Smtp-Source: AGRyM1vJ1WPDSD63N1RZT+NDdINiSIcOdEhufXa6Kjnl8wa7D062wQU14Xkv6/QBQU6bowIfstXT9iNQMo23xTuzn6g=
X-Received: by 2002:a05:6130:22a:b0:383:ef97:3ba9 with SMTP id
 s42-20020a056130022a00b00383ef973ba9mr10130988uac.49.1658427193683; Thu, 21
 Jul 2022 11:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <YtimUGVxhkIRhmte@xsang-OptiPlex-9020>
In-Reply-To: <YtimUGVxhkIRhmte@xsang-OptiPlex-9020>
From: jim.cromie@gmail.com
Date: Thu, 21 Jul 2022 12:12:47 -0600
Message-ID: <CAJfuBxw5QVOM6Tp6KT6OrcSaHWO_+bQsKS_W3Anb9vOOye=7OQ@mail.gmail.com>
To: kernel test robot <oliver.sang@intel.com>
Content-Type: multipart/alternative; boundary="000000000000c3f38405e454abbc"
X-Mailman-Approved-At: Thu, 04 Aug 2022 20:34:49 +0000
Subject: Re: [Nouveau] [drm] 39dec70a06:
 leaking-addresses.proc._dyndbg_classes.
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
Cc: kbuild test robot <lkp@intel.com>, nouveau@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, lkp@lists.01.org,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--000000000000c3f38405e454abbc
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 20, 2022 at 7:05 PM kernel test robot <oliver.sang@intel.com>
wrote:

>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-11):
>
> commit: 39dec70a061e581e60adb416031948ecd2dcd5d0 ("drm: POC drm on dyndbg
> - use in core, 2 helpers, 3 drivers.")
> https://github.com/jimc/linux.git dyn-drm-trc
>
> in testcase: leaking-addresses
> version: leaking-addresses-x86_64-4f19048-1_20220518
> with following parameters:
>
>         ucode: 0x28
>
>
>
> on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @
> 3.40GHz with 16G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):
>
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> below (1) is not observed on parent tests:
>




>
>
> 2022-07-18 02:55:06 ./leaking_addresses.pl --output-raw result/scan.out
> 2022-07-18 02:55:30 ./leaking_addresses.pl --input-raw result/scan.out
> --squash-by-filename
>
> Total number of results from scan (incl dmesg): 168569
>
> dmesg output:
> [    2.186392] mapped IOAPIC to ffffffffff5fb000 (fec00000)
>
> Results squashed by filename (excl dmesg). Displaying [<number of results>
> <filename>], <example result>
>

new section, populated by macro invocations in this patch

[3 __dyndbg_classes] 0xffffffffc08dad00        <----- (1)
> [18 __dyndbg] 0xffffffffc01fd4e0
>

So I think this is All-good.


>

--000000000000c3f38405e454abbc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 20, 2022 at 7:05 PM kerne=
l test robot &lt;<a href=3D"mailto:oliver.sang@intel.com">oliver.sang@intel=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
<br>
Greeting,<br>
<br>
FYI, we noticed the following commit (built with gcc-11):<br>
<br>
commit: 39dec70a061e581e60adb416031948ecd2dcd5d0 (&quot;drm: POC drm on dyn=
dbg - use in core, 2 helpers, 3 drivers.&quot;)<br>
<a href=3D"https://github.com/jimc/linux.git" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/jimc/linux.git</a> dyn-drm-trc<br>
<br>
in testcase: leaking-addresses<br>
version: leaking-addresses-x86_64-4f19048-1_20220518<br>
with following parameters:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ucode: 0x28<br>
<br>
<br>
<br>
on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40GH=
z with 16G memory<br>
<br>
caused below changes (please refer to attached dmesg/kmsg for entire log/ba=
cktrace):<br>
<br>
<br>
<br>
<br>
If you fix the issue, kindly add following tag<br>
Reported-by: kernel test robot &lt;<a href=3D"mailto:oliver.sang@intel.com"=
 target=3D"_blank">oliver.sang@intel.com</a>&gt;<br>
<br>
<br>
below (1) is not observed on parent tests:<br></blockquote><div><br></div><=
div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
<br>
2022-07-18 02:55:06 ./<a href=3D"http://leaking_addresses.pl" rel=3D"norefe=
rrer" target=3D"_blank">leaking_addresses.pl</a> --output-raw result/scan.o=
ut<br>
2022-07-18 02:55:30 ./<a href=3D"http://leaking_addresses.pl" rel=3D"norefe=
rrer" target=3D"_blank">leaking_addresses.pl</a> --input-raw result/scan.ou=
t --squash-by-filename<br>
<br>
Total number of results from scan (incl dmesg): 168569<br>
<br>
dmesg output:<br>
[=C2=A0 =C2=A0 2.186392] mapped IOAPIC to ffffffffff5fb000 (fec00000)<br>
<br>
Results squashed by filename (excl dmesg). Displaying [&lt;number of result=
s&gt; &lt;filename&gt;], &lt;example result&gt;<br>
</blockquote><div><br></div><div>new section, populated by macro invocation=
s in this patch</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">[3 __dyndbg_classes] 0xffffffffc08dad00=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &lt;----- (1)<br>[18 __dyndbg] 0xffffffffc01fd4e0<br></blockquote><div>=
<br></div><div>So I think this is All-good.<br></div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><br>
</blockquote></div></div>

--000000000000c3f38405e454abbc--

Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE67019DE88
	for <lists+nouveau@lfdr.de>; Fri,  3 Apr 2020 21:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB9B6E972;
	Fri,  3 Apr 2020 19:24:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1866E972
 for <nouveau@lists.freedesktop.org>; Fri,  3 Apr 2020 19:24:29 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id b12so8742241ion.8
 for <nouveau@lists.freedesktop.org>; Fri, 03 Apr 2020 12:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jnRbA/qfAuZrNiKW7PlDbNmNmhxrDXj54QKlbM9Oqfw=;
 b=d7VkOY2deeUHkwdplgi5lQCHavHOBxfkJAwy4crlz4R1CcXyyHPCn6Yqr+IkjBUrbJ
 TO2upVzWHTNOm0jIIjWUV8GLcDj/k6uw7MVTA8nA9zFiyK+2bWvTddpqnFWVqHfuVGoJ
 5mPfwbbDbR9fDOF6xGah/iC6MTzdUIHr2GMQmotSLj2zqjXvQnk5E6cYtMI8LZmBOxGD
 p/NzW+M02I1ozJ/fxOEqtsJ3SKTk9rheEZgzLUp0HNo5+/wG8qKtfqA4h8EOGGJnz44d
 nItwxxtRQ7rmLYJtlbKR/nGSgZoL6/5nhR/7hSEOAC5I4rqqAAxJbuRNeK065RrkFVpS
 Zp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jnRbA/qfAuZrNiKW7PlDbNmNmhxrDXj54QKlbM9Oqfw=;
 b=XjPT6yYGIBt24SntPWMdvXItACyV6CXP1rHP2cvPktpP3l51ZAoVb4kX5KmVlMe5NA
 2ZirUDilcf3xj+bsPim/F8iVjmXhf5rufcJ09Un7pH6AIsYh/ViC+K103jtNS2DEX5ne
 PdeAV8qThqJny5kH/goPp5PRyc60u5bHo6Xdv2VmQNJUy4VbyZ2ofbRVdgmn6IpFoodF
 jeuNY5VLXevipo1f0B+AhCfT+wdLUxrfTj6mS9PZLn5g8+on8JJCid8lL7pw7aFrc1my
 Wx+6La3vxL8HeK2u+S0TbBhUUKqd8k4hX5OING4UVWKJN2m7n8NFhESkJ62MjamS9uqt
 dQ8w==
X-Gm-Message-State: AGi0PuaanBrrW2KVCOQ5V2Asod/uIGetv+4l3+7OihXycmSKb5ENfl0L
 6bfLJtDSwg1rtIY/625NGOvxgLySvdqU9KUn2qg=
X-Google-Smtp-Source: APiQypIsEcnt7WhgbLb1UnP0hJFxH2K4F1u/DZj8zVJQrtDFzsuGNdl3JJoa//pjVgV64FrBImP7WH6EFEs1RlthxkM=
X-Received: by 2002:a02:b783:: with SMTP id f3mr9873509jam.4.1585941868678;
 Fri, 03 Apr 2020 12:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAOkhzLWMB8rr0x4KKfqruCcTLVq4dH6nZ365auMqA1arZ57J7g@mail.gmail.com>
 <CAOkhzLVvmoB0TgS4bioP4PnxwmnT_+h0LbCya2=KkcHu1UT_Zw@mail.gmail.com>
 <CAKb7UvgLr2A88jbx9Zvi3SjXoKbk4iZEg7LNQ4aL3VZhKVQu3A@mail.gmail.com>
 <CAOkhzLU+buL3J3XUbzC6JUAfbnMR-27qwS3Vm7ofrAPPCipXuw@mail.gmail.com>
 <CAKb7UvhvBG49P7t6XD==26q70YywmhUHvP=hW=wj8mT6V0gpHA@mail.gmail.com>
 <CAOkhzLW42a66wNL7Pz8+d+yO_oyZZJBEps=8WPHaXXFjb54dTQ@mail.gmail.com>
 <CAKb7Uvh=44_S_EAfma+JX9j_igaE3CSWws_TUqLWwJ50zcmA9Q@mail.gmail.com>
In-Reply-To: <CAKb7Uvh=44_S_EAfma+JX9j_igaE3CSWws_TUqLWwJ50zcmA9Q@mail.gmail.com>
From: Zeno Davatz <zdavatz@gmail.com>
Date: Fri, 3 Apr 2020 21:24:17 +0200
Message-ID: <CAOkhzLVGsOyKsf=Lm69UMGutWv-yZVFqZ=Yi61HDHCUCAwchoQ@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] acr: failed to load firmware with Kernel 5.6. Kernel
 5.5 works just fine.
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Apr 3, 2020 at 8:31 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> Depends on distro specifics. Also the firmware has to be available at
> the time that nouveau loads. The corollary to this is:
>
> If it's built into the kernel, then the firmware must also be included
> in the kernel (since this happens before any FS stuff)
> If it's loaded as a module from initrd, then initrd must contain the firmware
>
> If you need help including firmware in the right place, a distro
> support channel is probably your best shot.

Ok, thank you. So far no luck on the end.

https://wiki.gentoo.org/wiki/Linux_firmware

Please let me know if the fallback version comes back to life.

best
Zeno
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

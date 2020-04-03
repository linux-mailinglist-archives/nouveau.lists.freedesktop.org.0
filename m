Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4BB19DC9B
	for <lists+nouveau@lfdr.de>; Fri,  3 Apr 2020 19:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEAA6EC34;
	Fri,  3 Apr 2020 17:21:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665086EC34
 for <nouveau@lists.freedesktop.org>; Fri,  3 Apr 2020 17:21:00 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id p13so8011109ilp.3
 for <nouveau@lists.freedesktop.org>; Fri, 03 Apr 2020 10:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sac9Uo/AV73yZjiElwr8eWaCR4pb1bof561EHbRTu64=;
 b=dM013+ng78t/3X53N7v85k+s4ZNbqHcfrtirxafjWzepY8PPg0JTHflkLye5qy1deV
 nue2NGgEdV38O3280ERkwFJ9s7MMs/g6NbmoqP9corMbbjk80jcdwbOHsSu5mOjnRvWi
 SjZaqD50HXL56mZHaONcA2luuaQFeGSjSGizPcX6I9E1i6aHoPI7UnEAdY7KeOMxhQku
 zSE7DSbuUJ2sFoiXFAnLd9kev4UHIRp4UOnD0ndmRJSGGmx37vRwjsIHq3tcQOHDVcNk
 kxJHYwp+xlotwxFNK5IosKNZvGOdlig6i/epb2Qi4klqxsTFdGHQq8kjqcbq1hvN19LV
 9boQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sac9Uo/AV73yZjiElwr8eWaCR4pb1bof561EHbRTu64=;
 b=l5NTFVSF79MKydr+kaWoDP1/kmChO5dbaOpfTg5hGqjlecyeauFV4OK4CQhiyh9jwl
 G33pEEAm5qWtL+r47x3qQ6LHmd0mZj5R8jb1vpDD8K0PQufYsG7FHD8OdEMatisIOmDg
 KP/LeIFy4euqasYJR4QIDLyEzZ4O55SP+3wF4TcIQC236lDHKtII9U23mpd44qI+SIe3
 pA5ECvQOgqFqoiQhJG/otINR9k3+nN9ZLhjxZVkLEBsgEMIR+1mJnbPP5GMTwGvT7BdK
 pCQrim0v40vov3pK4QDwIvACPXFx5FMSFNAZ2tRrS5zhZQNM8iKtDgApzo5UEZxEK2TF
 Oeow==
X-Gm-Message-State: AGi0PubRqEUGzYYisV844+WxoSPOHkKC+pm5bH6bJKCbGWwsIj5ctAxU
 DTq9KBQ7rgCF3CNv2/LbUEpsMInqlXMfbRlgSws=
X-Google-Smtp-Source: APiQypKhx4DmB8pyY5Du9sl19ryD9Wes6Uc6oIqTsWadyRlkNrp3V3mocbD7V7mnyTwz3JXwisn/9II8tbeobuPC230=
X-Received: by 2002:a92:912:: with SMTP id y18mr9943998ilg.299.1585934459694; 
 Fri, 03 Apr 2020 10:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAOkhzLWMB8rr0x4KKfqruCcTLVq4dH6nZ365auMqA1arZ57J7g@mail.gmail.com>
 <CAOkhzLVvmoB0TgS4bioP4PnxwmnT_+h0LbCya2=KkcHu1UT_Zw@mail.gmail.com>
 <CAKb7UvgLr2A88jbx9Zvi3SjXoKbk4iZEg7LNQ4aL3VZhKVQu3A@mail.gmail.com>
In-Reply-To: <CAKb7UvgLr2A88jbx9Zvi3SjXoKbk4iZEg7LNQ4aL3VZhKVQu3A@mail.gmail.com>
From: Zeno Davatz <zdavatz@gmail.com>
Date: Fri, 3 Apr 2020 19:20:48 +0200
Message-ID: <CAOkhzLU+buL3J3XUbzC6JUAfbnMR-27qwS3Vm7ofrAPPCipXuw@mail.gmail.com>
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

On Fri, Apr 3, 2020 at 6:59 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> Ben -- probably the ACR changes in 5.6 don't fall back nicely anymore
> when there's no firmware? The load shouldn't be failed, just GR
> disabled...
>
> Zeno -- if you grab linux-firmware, it should be all better. Not sure
> if you're missing it on purpose or by accident.

Thank you, Ilia

I will try that on my Gentoo/Funtoo machine now. So far linux-firmware
was not needed with Kernel 5.5, so it was not installed on my machine.

[ please CC me ]

Best
Zeno
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F78130056A
	for <lists+nouveau@lfdr.de>; Fri, 22 Jan 2021 15:30:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5956E489;
	Fri, 22 Jan 2021 14:30:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2406E489
 for <nouveau@lists.freedesktop.org>; Fri, 22 Jan 2021 14:30:41 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id d6so1366140vkb.13
 for <nouveau@lists.freedesktop.org>; Fri, 22 Jan 2021 06:30:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XYJLK2FGIUw9syQl35Omc930cfw2Q6NfeX70Ji7Mjjg=;
 b=X0K05Ys4nCKSWy30TvLOQM0/SLCsPP8pnDOFuBeqQXf6AI2hHcDMfkohcO5RwkvBx2
 0dvpNsT5rLSN2KNsPn9xt3+r23VN+so/lJRXVkCfzupJJWc1ZuibtUjEHxrSugbIlSTl
 NPaNFyMPg5UUaMgouWYxAZq6GoH3obzuR7zPhzSsWuDMYWEcYFxlVEYSsf/kU5QkyNO8
 bFTtUeAlZwcj2/6mejLUljgjXRTyrjcu3r5oBlfLmf689OpxShuHuSF+LpJoopx0oJI4
 /i/5HiO3aeodW73k+541TMTCBU1g3SZ0KTWHwBl/IFOJ2E8jZ2d+lIqZ6zywfex5FblH
 tdkQ==
X-Gm-Message-State: AOAM533mVt7hfQUhlsUQwPyLbEUz6TQ3XcJ2REhevuLS1181jI3vaO62
 MZXGJqZrlxNR0Whp2wkKSVPmJgq/cYVU+fbYB7c=
X-Google-Smtp-Source: ABdhPJxviRL4+lOf2Ur+lQ6+ejObiIi8d2iJgqfRQFvk8AlZhUGdhdnSrG/qGbyogddFwauYu3LikYFzCnEvLQKQhtE=
X-Received: by 2002:a1f:9ed4:: with SMTP id h203mr515816vke.1.1611325841094;
 Fri, 22 Jan 2021 06:30:41 -0800 (PST)
MIME-Version: 1.0
References: <CAPpdf5-SoO4qPKg7WuvRsCMT4RGV34gNp+M0ir27a1E8Qu+s4g@mail.gmail.com>
In-Reply-To: <CAPpdf5-SoO4qPKg7WuvRsCMT4RGV34gNp+M0ir27a1E8Qu+s4g@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 22 Jan 2021 09:30:29 -0500
Message-ID: <CAKb7UvjfPptmKDm_jma90Q0T+JoTmETL-Y0-KzTbv9z7f=ccoA@mail.gmail.com>
To: o1bigtenor <o1bigtenor@gmail.com>
Subject: Re: [Nouveau] Request for help in adding a HDMI output
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Jan 21, 2021 at 9:59 PM o1bigtenor <o1bigtenor@gmail.com> wrote:
>
> Greetings
>
> Running a debian testing system
> $ uname -r
> 5.4.0-4-amd64
> with 2 graphics cards.
> The one I'm working on is a: GP 107 Nvidia  GTX 1050 Ti
>
> Asus ROG GeForce GX 1050 Ti Strix-GTX1050 Ti with 2 - DVI plus 1 DP1.4
> and I HDMI2.0 ports (four in total).
>
> I have been running 2 1920x1080 monitors on this card (and its
> previous nvidia 570) for quite some time. Been running nouveau for the
> last about 4 years as my last nvidia 570 (started with 3) is EOL by
> nvidia.
> Have gotten quite comfortable using xrandr setting up the second card
> (the nvidia 570) and its 2 monitors. Nouveau software is:
> xserver-xorg-video-nouveau -> 1:1.0.16-1 ;
> xserver-xorg -> 1:7.7+21 ; and libdrm-nouveau2:amd64 -> 2.4.102-1 .
>
> I want to add a 4k TV onto the HDMI port on card #1.
> Can't seem to get the card and the TV talking.

Unfortunately my initial attempt at supporting >340mhz modelines over
HDMI was incomplete -- worked in my own testing, but not for everyone.
(You need 597mhz to get 4k@60.)

Ben was able to figure out what was wrong and fix it:

commit a1ef8bad506e4ffa0c57ac5f8cb99ab5cbc3b1fc
Author: Ben Skeggs <bskeggs@redhat.com>
Date:   Fri May 29 15:18:47 2020 +1000

    drm/nouveau/disp/gm200-: fix NV_PDISP_SOR_HDMI2_CTRL(n) selection

I believe this change is in kernel v5.8. If you don't want to upgrade,
just ensure you pick a 30hz mode-line for that display, which should
enable 4k to work.

Also it looks like you have both GPUs plugged in, and slaving one off
the other. If possible, I'd recommend to keep everything on one GPU.
The DP port can (most likely) be used for HDMI or DVI with a passive
converter (not sure if it can be used with HDMI 2.0 though). Having
remote displays is not a great experience (it does work though, and
better than nothing in cases that require it).

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

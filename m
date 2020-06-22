Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E07A9203ACA
	for <lists+nouveau@lfdr.de>; Mon, 22 Jun 2020 17:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531686E839;
	Mon, 22 Jun 2020 15:25:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3A56E839
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2020 15:25:47 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id l24so8011uar.10
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2020 08:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z5tcagt1q3z0x3GmmYZCZymOMRkovZrCAFsbCuuQE80=;
 b=bAnDj8epecMjzr4psaNWnUkg82zRJKIjIVSjLha0rHwDgRB+ltsO8YTEuXmMKFnCpL
 bRlmSDtul6MbdDHGQOFCG4nJorCi7Rb/6R58NzCl2ES7KFuVkDMvKFwmu2FD6UY9fpbS
 cA7jvkws6eaXzms/l59a9wK3aVeiPR90UBZ5CO+nHU5B6Upw2hPs4QeXUZcg8K3GS24n
 kbKmgRiHPEZ7f2Yq0z6hN6G4sYibwBtobX+nolt/9DjC0pA3Lr32Ku6DXXU2kij2TVyx
 JbAf7Cpv9d8dSIA6CHVa7U69dLjmIQBseuzFZmhtlM19wxaK+P61ikWFQL1aNHUkhZbX
 dSkQ==
X-Gm-Message-State: AOAM5313SNW4ZyNZyzytJX/wyBlkB7X+95SyqjIjcCEyXtp6iU322h2B
 T6dZm8fTPPVmMzfqgKbB3xH9WMGK5afktR33HRaARNQ/
X-Google-Smtp-Source: ABdhPJz5xPRdv2xwfudv0jXZ3SJpS5os0ELMatbrtqIMVjiRxeqdAm3a5Pn+MfAblrU7wegKHmyKAELdS9bvZkR3b7U=
X-Received: by 2002:ab0:13f3:: with SMTP id n48mr11259523uae.109.1592839546010; 
 Mon, 22 Jun 2020 08:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <abb79c7114a58cf5b31542009531897c@zonnet.nl>
In-Reply-To: <abb79c7114a58cf5b31542009531897c@zonnet.nl>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 22 Jun 2020 11:25:34 -0400
Message-ID: <CAKb7UvidTyx6+yQbJ-sy=yh9YqrMQ0=gh6a0WHmqS94VvZSUPQ@mail.gmail.com>
To: Jeroen Diederen <jjhdiederen@zonnet.nl>
Subject: Re: [Nouveau] nouveau on G5 Macs
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

Which GPU do you have? The NV40 AGP board (GeForce 6800) works
particularly poorly. However as long as you go with 4k pages (and
there's no real benefit to 64k pages for most applications), basic
things should work. I wouldn't recommend using a GL-based compositor
though.

Which distortion are you talking about?

Cheers,

  -ilia

On Mon, Jun 22, 2020 at 11:10 AM Jeroen Diederen <jjhdiederen@zonnet.nl> wrote:
>
> Hi all,
>
> I have been trying to solve nouveau issues on my iMac G5 for ages. As
> far as I can understand it, there is a problem with nouveau and page
> size mapping. I tried both 64K and 4K page size kernels and the the
> result is always distorted video.
> There is an old To-Do list, which says "fix the page size mapping
> problem on G5/64 bit for exposing fifo regs" on
> https://nouveau.freedesktop.org/wiki/ToDo/.
>
> Is there any chance that this bug will be fixed ? I am not a programmer,
> so I can't be of any help.
>
> Jeroen Diederen
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B89914FECB
	for <lists+nouveau@lfdr.de>; Sun,  2 Feb 2020 19:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE4C6E0FD;
	Sun,  2 Feb 2020 18:57:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4806E0FD
 for <nouveau@lists.freedesktop.org>; Sun,  2 Feb 2020 18:57:31 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id k188so7521801vsc.8
 for <nouveau@lists.freedesktop.org>; Sun, 02 Feb 2020 10:57:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XWrPQ1QVf/RXnmvXP2CXMookfajtPYWGHkQcSKJ4dEk=;
 b=NdN4/PVBtfZpGh/1fg3088rF7S2TvUW2Bs+Kt0q3zKYharsmJEKgdlV4aPsAoOITYT
 E//9z0+JO23wF1TELlTOVJa+N9mlUXIELU/D1957dbeXoqMtZtY6hnyTLucOXMa3tAQq
 qp7tJQHdT93BGuYH054TM5m2uC8DfxjXTmTPk2ZsXEC9siOpVAkQkZyUIrIFRFRRFpiz
 cRp9h5WrXhKwt2pSaioM4llTl4bBdC9FQHzgxQ2hlqDxrqKgMOw+fyV4aTS8b+Cw2Tvj
 BwXrAXQZ0gtjaXNzD94RPyFH26bs3EgM6ilX9K5nY3AqOBYD6Z6i6Bt5hhOMzuVw7tpk
 5WLA==
X-Gm-Message-State: APjAAAWYWxfpFNx8xi5vCrQJejkRnD4XFO6X6Zdo3IrsVxSIQY4SLoYz
 W1Z0Y3oMByVqvgffY5dXOycg89MnFvL3WbZds6k=
X-Google-Smtp-Source: APXvYqy/3IbJsqDR/1FOGc8rJzu7yAJkhakDvRq3PUJeWHG5xOG2GPaspkhq3u5nCWEq+R7sD1nXiaC5YI9UiuSb+Rw=
X-Received: by 2002:a67:f412:: with SMTP id p18mr13352164vsn.207.1580669849986; 
 Sun, 02 Feb 2020 10:57:29 -0800 (PST)
MIME-Version: 1.0
References: <608e9087bdb9d18d661912e9704d6d563e510865.camel@mailbox.org>
In-Reply-To: <608e9087bdb9d18d661912e9704d6d563e510865.camel@mailbox.org>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sun, 2 Feb 2020 13:57:18 -0500
Message-ID: <CAKb7UvgfACSrGh6fpuXiE61t7upPJAVggg-cQPV5VwyjmvoHWQ@mail.gmail.com>
To: Dennis den Brok <ddb@mailbox.org>
Subject: Re: [Nouveau] Firmware required?
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

All GPUs supported by nouveau (Riva TNT and newer) can work without
additional firmware. It all depends on the definition of what one
means by "work", of course.

Across the board, modesetting works without any additional firmware
(i.e. lighting up displays, making pictures appear on them), including
DP-MST. There is no support for HDR yet, but it's something I've
dabbled with a bit. (No firmware required.)

NV17/18 boards (GeForce 2/4 MX) have support for MPEG1/MPEG2 decoding
acceleration, but there is no support for this in nouveau (no firmware
required, just ... motivation).

NV4x/G7x (and the G80, I think) boards have a VP1 video decoding
engine which helps with some sort of WMV accel, which would require
firmware to operate. However there is no support for this in nouveau,
no linux drivers shipped by NVIDIA ever supported this, and by all
accounts, it didn't actually make things faster on Windows.

Starting with the G84 (and nouveau support ending at the GK20x
series), you need additional firmware for video decoding acceleration.
There is a script to extract this firmware from shipped NVIDIA
drivers, although the results can't be redistributed. This is detailed
at https://nouveau.freedesktop.org/wiki/VideoAcceleration/ . There are
some bugs in the H264 decoding which have never been tracked down, but
for most videos, it works fine.

A handful of GK106 boards (marketed as GTX 660) benefit from
NVIDIA-supplied context switching firmware. We have no idea why - the
nouveau-supplied one should be fine, but probably some error condition
is mishandled. Or something else odd.

Kepler and newer boards support video encoding, which requires
firmware, but nouveau has no support for this.

Starting with GM20x (generally, marketing names like GTX 9xx, but not
always), you need additional firmware for any 2D/3D acceleration, as
cryptographic signatures are verified by the GPU. While NVIDIA
supplies the firmware needed for acceleration (generally with a 1-2
year delay after launch), they do not supply the firmware necessary
for the PMU, which would control things like fans, voltages, clock
frequencies. Since (modern) GPUs boot up in the lowest performance
levels, that means that you're stuck there with nouveau, getting 5-10%
of maximum performance, depending on specifics.

There is presently no 3D acceleration support in mesa for Volta or
Turing, although I'm told this is in the works. There is also no 2D
acceleration support for Volta or Turing in xf86-video-nouveau.
Volta's shader execution model has changed somewhat from earlier gens
(while Fermi/Kepler/Maxwell were largely identical), so this has
required some additional effort (and since there's no ability to have
reclocking on those boards, a profound lack of caring from me).

I expect there are bits I missed here ... not 100% sure whether s2ram
would work on GM20x+ without firmware.

Hope this helps,

  -ilia


On Sun, Feb 2, 2020 at 6:09 AM Dennis den Brok <ddb@mailbox.org> wrote:
>
> Dear nouveau@,
>
> please forgive me if this is a FAQ or otherwise obvious; it isn't to me
> from searching the web, the nouveau mailing list archives and various
> Linux distributions' wiki pages.
>
> I'd like to know for which nvidia GPUs a firmware binary blob needs to
> be loaded to the GPU in order for nouveau to work with it, including
> binaries from what is often called "linux-firmware".  Hopefully more
> precisely:
>
> Are there GPUs supported by nouveau which do not work at all without a
> binary blob?
>
> Are there GPUs which work partially without a firmware binary blob?
> What are the restrictions?
>
> Are there GPUs which work without restrictions?
>
> If there is a resource with answers to my questions, I'd be grateful
> for a reference.
>
> Please CC me, as I am not subscribed to the list.
>
> Thanks and regards,
>
> Dennis den Brok
>
>
>
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

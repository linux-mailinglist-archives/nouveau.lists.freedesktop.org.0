Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471D780258A
	for <lists+nouveau@lfdr.de>; Sun,  3 Dec 2023 17:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2511E10E295;
	Sun,  3 Dec 2023 16:37:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532CC10E295
 for <nouveau@lists.freedesktop.org>; Sun,  3 Dec 2023 16:37:23 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1f03d9ad89fso1942437fac.1
 for <nouveau@lists.freedesktop.org>; Sun, 03 Dec 2023 08:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701621442; x=1702226242; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6/1Ex/17xt68FSzYSTQweuamfpY0NLsD1LfoA1IU50Q=;
 b=DvG4/6V55cYG1O4BKtnRbYOerAgVQj2mnsJP/uvkbJWmCSOdfs/Kz72zqqKXiGZvMx
 2ii4wEacT3mHIdicdNoo4l74LmJWH5f846n/fMATSm6o6CQ+kiTTiEtQy46ret2+mfzV
 +14tRdopxQhag9awJmneOrXpkRPzbjurFuowthHESBo0topeEIfUXCPK9TzUvuBSWZWN
 fHkSW3IdYbGaux54hzhdch/tf+i0Dbp81u2SwyHOVhSfxnkk4++ZTHxqBLIEq4W5/H8c
 FbBA27kH7bZ1jweww5laf0KoWpWBsMibYts4fp89K3T0X1Gdnozb1fkoGBM/NsBNKxO1
 r3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701621442; x=1702226242;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6/1Ex/17xt68FSzYSTQweuamfpY0NLsD1LfoA1IU50Q=;
 b=gbtDJ5mrAdMPocJ+8iF28j131NzUr1Qb9WjNMEQGVZd93cW59brZW4Qw7ieV8YgNT9
 WkuNkVKIoRFHX7bhqujBl+vekNktTcMau0ie9EvjRw8MZqok4fgYCE4re3dphV/e3bnO
 ZxSNoOJvtU9WOdB5zZAjWi08yidwR0fuRbPIxuYnvF1eLspUJBAN6ewTBx7udHU9xrT/
 5TJlD54gZMKYicHtAs/EDNN7KAGMcuwtvICXFw++CKNSyM3VFxj/QWTk+xMC5xmaEVkz
 9jI1AHLPKkxFaRtN05bXT+HxZ5w5HoPdT09SGfPifbwlU6f7nKtuAX7vNfV6Hsquqfz1
 06rg==
X-Gm-Message-State: AOJu0YzrhRudc/znhrfX9iSRRZ6XHTyO20CDk4cqBAUoRByoRB4NPXmG
 XQ5CzvhuPiBg7kE0vVXw+PgAFsELIshevGsMGqiH2Ocn3jw=
X-Google-Smtp-Source: AGHT+IHLLk/s4Xd8fo3NBlLzdDBlTpIgrNkb0ZreC1EY8WjmBFERtEjwEKB6y04iB/zvo/R4KXXFIQKIiAeThXISCZU=
X-Received: by 2002:a05:6870:9d9b:b0:1fb:75a:6d49 with SMTP id
 pv27-20020a0568709d9b00b001fb075a6d49mr3344219oab.112.1701621442127; Sun, 03
 Dec 2023 08:37:22 -0800 (PST)
MIME-Version: 1.0
From: Monty Montgomery <xiphmont@gmail.com>
Date: Sun, 3 Dec 2023 11:37:11 -0500
Message-ID: <CACrD=+_79g1_-EbiOk5YCbHV+x_ZFz+qDDcoXGdRGx-SVirZrg@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Subject: [Nouveau] PR: nv50 IB-mode DMA crash fixes
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

I didn't file an Issue as I understand the cause and have a successful
patch that I've been running here for several days.
gitlab.freedesktop.org is RO (ie, I can't fork/stage a PR there) so I
committed the absurdity of creating a PR on the public gitlab mirror
in order to have a URL to point to:

https://gitlab.com/freedesktop-mirror/drm/-/merge_requests/1

copypasting the commit message:

    nv50 IB-mode DMA crash fixes

    Address the following nv50 IB-mode dma code errors:

    1) nouveau_drm.h labels NV50_DMA_PUSH_MAX_LENGTH "Maximum push buffer
    size". Perhaps originally true(?), but nothing suggests, guards, or
    enforces the assumption, and it's not true in practice.  0x7fffff is
    not the maximum possible push buffer size submitted for IB-mode DMA
    transfers, nor is it the maximum legal DMA transfer size (it is three
    bytes too large according to our reverse-engineering docs).

    2) nouveau_gem_ioctl_pushbuf() still implicitly treats bit 23 of the
    pushbuffer buffer[].length field as NOUVEAU_GEM_PUSHBUF_NO_PREFETCH,
    despite previous commits moving the flag out of the length field for
    lower levels as this is an nv50-hardware-specific arrangement.  It
    also conflicts with point 1 above as pushbuffers can be equal to or
    greater than 1<<23 in practice.  (Does the ioctl code in question have
    reason to set or expose no_prefetch?)

    3) Bits 0 and 1 of the length field are passed through and placed into
    the IB entry, but they don't signify length in the DMA request.  Bit 0
    is labeled an unknown flag, bit 1 specifies use of the non_main
    transfer counter.  DMA transfers can only be whole words, despite
    pushbuffers not being restricted to whole-word lengths.  So there are
    two ways this can bite: Setting flags we don't mean to set and not
    transferring trailing bytes in incomplete words.

    Changes:

    This PR makes the following changes toward the single logical change
    of 'Don't lock up Quadros when using CAD':

    1) NV50_DMA_PUSH_MAX_LENGTH is reduced from 0x7fffff to 0x7ffffc, the
    maximum value that can actually be encoded in a DMA request.

    2) nouveau_gem_ioctl_pushbuf() no longer looks for
    NOUVEAU_GEM_PUSHBUF_NO_PREFETCH in bit 23 of the length field, and
    always sets no_prefetch to 0 in the call to nv50_dma_push() when using
    IB-mode.

    3) nouveau_gem_ioctl_pushbuf() specifies (push[].length + 0x3) << 2 >>
    2 for DMA transfer length to enforce complete-word IB-mode transfers
    that also send trailing bytes.

    4) nouveau_gem_ioctl_pushbuf() splits pushbuffers longer than
    NV50_DMA_PUSH_MAX_LENGTH (as calculated in 3 above) into multiple
    calls to nv50_dma_push() when using nv50 IB-mode.


Although I understand the cause, the patch raises a few other
unknowns-to-me I'd like some commentary on:

1) The nv50 DMA code clearly believed push buffers could not (or
should not) exceed NV50_DMA_PUSH_MAX_LENGTH, when my analysis logging
shows that they regularly exceed this maximum by an order of magnitude
or more.  Was the assumption originally true?  If so, when/why did it
change?  Is the more correct fix to enforce individual pushbuf size
limits?

2) Are any of the documented bit flags that 'hug' the length field
(NON_MAIN, NO_PREFETCH, etc) actually used/useful at the level of the
GEM API?  Right now, two are exposed by accident (because the code
thinks the length is byte-granularity when the lower two bits are
actually flags) and the third is broken out explicitly--- but it's
actually only ever set by a clobber from push[i].length exceeding
0x7fffff.

Monty

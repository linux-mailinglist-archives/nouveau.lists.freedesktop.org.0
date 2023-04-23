Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BFD6EC163
	for <lists+nouveau@lfdr.de>; Sun, 23 Apr 2023 19:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4B210E0DA;
	Sun, 23 Apr 2023 17:36:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A246710E0EF
 for <nouveau@lists.freedesktop.org>; Sun, 23 Apr 2023 17:36:45 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-959a626b622so21221366b.0
 for <nouveau@lists.freedesktop.org>; Sun, 23 Apr 2023 10:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1682271403; x=1684863403;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wNv3VClFzMvt3MDI7I2HzZM+U4+0tRFHNLn+/5zq8Hk=;
 b=ICB9f2XYji9QBkEQ20ggHB4He1kLG+CmpUtVBzlw85+XZnVMWov4Z0KbL79vWgMS/M
 jpOo7T1XzkagLlnFOzg+BSvAZbAOMpkw4KUU75Ul3OKq4HcNeUnC0s4Avd+RqCGzXwV1
 AVPnqpnLVLoDJTxHOivuTU7cd/cpNTjWddB80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682271403; x=1684863403;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wNv3VClFzMvt3MDI7I2HzZM+U4+0tRFHNLn+/5zq8Hk=;
 b=Wth/rRqNVMtpFop82mbk3C5syl+CY7NeC/Yr6SormDNWFZN4nssMTpy6eWd/fhepHu
 9Rq2D3BK/CUwre/YKtNjYkSqw4mgaGStVesE4XJtAKKHI2CCWtmrZ2YTVQVaURIKzpzx
 iRWNCB3Y8nyJjLuWC4dkOx1U82COx8N8+tcoO2C9470hY0pL3Bs+kVWeAOjGsIP4yHx3
 5q0HG/35D3Ky3nux3nWeIw1p9aCA1/hfvcIVnbMwlwnOWs4dMpKdzeFmT5PnjRdJpAtR
 /nuTvVdd5APbEAz2QXPp/ieeGbhhgzAuwZVxVBmpwme/OdK/XdEbbVSfNQ/+Ry0ETDxZ
 YgTA==
X-Gm-Message-State: AAQBX9fGiTOAN+euh9sxNDHXG9n6k5CPluYviiGTTuHmOY66lPWBtvyz
 kVjmTvk+7DZqByR64QNKfDzVmwGvU5ODervMdz1ifw==
X-Google-Smtp-Source: AKy350YH3N6vY1pvJ6DdJ58M4MFUyGH0XAGmvLfNYQ827+lsDWxpVLJhZ5fqCLrpdYV6eNNy4g9K/w==
X-Received: by 2002:a17:906:71d8:b0:94f:3074:14fe with SMTP id
 i24-20020a17090671d800b0094f307414femr7710901ejk.17.1682271403598; 
 Sun, 23 Apr 2023 10:36:43 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com.
 [209.85.218.41]) by smtp.gmail.com with ESMTPSA id
 mb20-20020a170906eb1400b0094f432f2429sm4601778ejb.109.2023.04.23.10.36.41
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 10:36:42 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-953343581a4so506836266b.3
 for <nouveau@lists.freedesktop.org>; Sun, 23 Apr 2023 10:36:41 -0700 (PDT)
X-Received: by 2002:a17:907:7659:b0:94d:a2c2:9aeb with SMTP id
 kj25-20020a170907765900b0094da2c29aebmr7938240ejc.49.1682271401463; Sun, 23
 Apr 2023 10:36:41 -0700 (PDT)
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 23 Apr 2023 10:36:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=whMiMqAv5ATKRkjrdgP2R7WgWmCS4hW2mPwBcL=gzdDNw@mail.gmail.com>
Message-ID: <CAHk-=whMiMqAv5ATKRkjrdgP2R7WgWmCS4hW2mPwBcL=gzdDNw@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: [Nouveau] Disabling -Warray-bounds for gcc-13 too
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
Cc: nouveau@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Kees,
  I made the mistake of upgrading my M2 Macbook Air to Fedora-38, and
in the process I got gcc-13 which is not WERROR-clean because we only
limited the 'array-bounds' warning to gcc-11 and gcc-12. But gcc-13
has all the same issues.

And I want to be able to do my arm64 builds with WERROR on still...

I guess it never made much sense to hope it was going to go away
without having a confirmation, so I just changed it to be gcc-11+.

A lot of the warnings seem just crazy, with gcc just not getting the
bounds right, and then being upset about us going backwards with
'container_of()' etc. Ok, so the kernel is special. We do odd things.
I get it, gcc ends up being confused.

But before I disabled it, I did take a look at a couple of warnings
that didn't look like the sea of crazy.

And one of them is from you.

In particular, commit 4076ea2419cf ("drm/nouveau/disp: Fix
nvif_outp_acquire_dp() argument size") cannot possibly be right, It
changes

 nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[16],

to

 nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],

and then does

        memcpy(args.dp.dpcd, dpcd, sizeof(args.dp.dpcd));

where that 'args.dp.dpcd' is a 16-byte array, and DP_RECEIVER_CAP_SIZE is 15.

So yeah, it's copying 16 bytes from an argument that claims to be 15
bytes in size.

I think that commit was wrong, and the problem is that the 'dpcd'
array is something 15 and sometimes 16. For example, we have

  struct nouveau_encoder {
        ...
        union {
            struct {
            ...
                u8 dpcd[DP_RECEIVER_CAP_SIZE];
            } dp;
        };

so there it's indeed 15 bytes, but then we have

union nvif_outp_acquire_args {
        struct nvif_outp_acquire_v0 {
            ...
            union {
                ...
                struct {
                    ...
                    __u8 dpcd[16];
                } dp;

where it's 16.

I think it's all entirely harmless from a code generation standpoint,
because the 15-byte field will be padded out to 16 bytes in the
structure that contains it, but it's most definitely buggy.

So that warning does find real cases of wrong code. But when those
real cases are hidden by hundreds of lines of unfixable false
positives, we don't have much choice.

But could the Nouveau driver *please* pick a size for the dhcp[] array
and stick with it?

The other driver where the warnings didn't look entirely crazy was the
ath/carl9170 wireless driver, but I didn't look closer at that one.

                 Linus

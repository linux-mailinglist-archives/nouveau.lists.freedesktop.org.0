Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 657AB803999
	for <lists+nouveau@lfdr.de>; Mon,  4 Dec 2023 17:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7790189F63;
	Mon,  4 Dec 2023 16:05:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C4E89F63
 for <nouveau@lists.freedesktop.org>; Mon,  4 Dec 2023 16:04:58 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-58d3c9badf5so3171404eaf.1
 for <nouveau@lists.freedesktop.org>; Mon, 04 Dec 2023 08:04:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701705898; x=1702310698;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V07DZ1Y+E4FTlwPkX8dinSMOp1DAL/cMRo3e/eT3UbU=;
 b=XjO4VOggU22EcIsAMonS/8jmco2XztpfICojakjp5YFsYaVeuja4bocpHbF/Y4n5tZ
 MD5QYsVil+OVSPCkQUC07BzwR/aT8CAeMoZvCoKupUK31WtVoCAxtWv84GFSM6bhi/DQ
 fF2/cAylgDJIwca3YPjVTvEc4DyhU1jBm11s3ZEjWDx82jW6JHBIBqIdFOerE5vFVIVw
 NzsMEkS667+UrqtJXXKV8k3GPcmCOelEZCiDXxCgWdEamDqvvwz4iJfLKkFXqxZ/v7Qc
 dI0M5/sJK+6XEFFE78rQMP/LY1xlmLoOE/IUZQqMc5K8fkQ0RYFv2hLGAa5N2cTUltqZ
 hrYA==
X-Gm-Message-State: AOJu0Yy0UTIzOuZFIHL/r1U4Y7KkfSEnScpIKOeXCgrajS+VmU9J3vQq
 Sfq0qew1uTh/Y7EDqmmECJ5+a0MZeccRDsjiz9Q=
X-Google-Smtp-Source: AGHT+IEtQJJdACUWVQ8P4yyBIktm4+4hcvcA2Y0KIFJRaNyZrBDXJy3aXUEfb0WS1wG7ORMPDinleoCQsdKQRafxIv4=
X-Received: by 2002:a05:6358:7e91:b0:16e:508e:1706 with SMTP id
 o17-20020a0563587e9100b0016e508e1706mr4164741rwn.25.1701705897991; Mon, 04
 Dec 2023 08:04:57 -0800 (PST)
MIME-Version: 1.0
References: <CACrD=+_79g1_-EbiOk5YCbHV+x_ZFz+qDDcoXGdRGx-SVirZrg@mail.gmail.com>
In-Reply-To: <CACrD=+_79g1_-EbiOk5YCbHV+x_ZFz+qDDcoXGdRGx-SVirZrg@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 4 Dec 2023 11:04:46 -0500
Message-ID: <CAKb7UvijhyMJ7e5Pp=mYA2YTXhCC02Q8Ne3RmDEQC5uF6pmvyg@mail.gmail.com>
To: Monty Montgomery <xiphmont@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] PR: nv50 IB-mode DMA crash fixes
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
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sun, Dec 3, 2023 at 11:37=E2=80=AFAM Monty Montgomery <xiphmont@gmail.co=
m> wrote:
> 1) The nv50 DMA code clearly believed push buffers could not (or
> should not) exceed NV50_DMA_PUSH_MAX_LENGTH, when my analysis logging
> shows that they regularly exceed this maximum by an order of magnitude
> or more.  Was the assumption originally true?  If so, when/why did it
> change?  Is the more correct fix to enforce individual pushbuf size
> limits?

The BO itself can be artibrarily sized. However the length stored in
the ring only has so many bits, so that provides a natural maximum.

https://envytools.readthedocs.io/en/latest/hw/fifo/dma-pusher.html#ib-mode

This might be different on newer gens though.

Cheers,

  -ilia

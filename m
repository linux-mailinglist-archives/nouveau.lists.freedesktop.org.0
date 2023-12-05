Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C1C804663
	for <lists+nouveau@lfdr.de>; Tue,  5 Dec 2023 04:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D395110E478;
	Tue,  5 Dec 2023 03:27:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BFE10E055
 for <nouveau@lists.freedesktop.org>; Tue,  5 Dec 2023 03:27:04 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33338c67d20so2535934f8f.0
 for <nouveau@lists.freedesktop.org>; Mon, 04 Dec 2023 19:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701746822; x=1702351622; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1pVW3+okb5k3ajoiAIGpvbpEMFmIStK2BI7Et/t1t94=;
 b=DEZlqWpPJv2CEfBJZWNMbhba4cFpyfFoTcYR36TEtQqLJfpG1G4sICA9xY6jQW11jX
 riMDDSV0PHenkCvi1f8Cfx+LIoLuG4YzqTCrTzO85koJGjUvCWtzicMWpBD3QYLzb/wW
 PiDvFy2pYSdchk5TurAX1LTv1HuMNqEVmJDomDIKRZcK7of9RDKezaZrJstlyXFG0isU
 6Bi0CNtVAyq/WvO0A+xngkjgWFLSLy2v9ovh3uyc4KeiM6IjUi79DZ42bFASi295rzV2
 qPbr4Bv99LCEf8mdGC8Jws/lkNVRRdhw3IlDx/XavH7jAVk91ssdgYJYEiKCM2WM7Ant
 k/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701746822; x=1702351622;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1pVW3+okb5k3ajoiAIGpvbpEMFmIStK2BI7Et/t1t94=;
 b=nIrm9CpSMgXKSKMB/xqG58sH+hnPsV1UonhN89C/RLHnDOeNYpkBx2gE4gw3obiZ+B
 P1ShMWNN05LuQUrV/jBWvJe/a534O2wbqBT5FK/EoSbrOlvY0kId+sUWRmzup/SiVON+
 okxiqYU8TzhY1zFeC+jBU0vFU9oLuDWnaxjLiItVBU7m9a32+vsIlL9cV8aXvJvhGLyJ
 OpQGiKmzFs0biBciGuBV5CN8hoQjAJ5ctGw4hL2ut8OewsuTfDMSgF17y4/gBNUufy0q
 PG8R3RLnjZxnr6QJqWsJ/8zN9pm8vab8esTs8lTbiv0UApdvkaBBtlPfHlmThoBaS0/O
 b6vw==
X-Gm-Message-State: AOJu0Yy+ZksFFlKf3sfr6e0pmZQpnl2Ti8jYPgbYDnUnAhtpOksB2QZu
 IJwlTlEnNJdiw0DnBLIHFyQndooQZop4Eg/HsFw=
X-Google-Smtp-Source: AGHT+IELDX0kERz+YGkFoDNCXezdsg0e+hI6h69S7tW4rdB+ATZgQTubJkiSiCU6+Ue5NyOzJBRxBMxTB56bXFQCvfw=
X-Received: by 2002:a5d:460b:0:b0:332:d309:a9fb with SMTP id
 t11-20020a5d460b000000b00332d309a9fbmr4081002wrq.2.1701746822327; Mon, 04 Dec
 2023 19:27:02 -0800 (PST)
MIME-Version: 1.0
References: <18c3097d144.f5b40a2d3930.7461400275770948859@zoho.com>
In-Reply-To: <18c3097d144.f5b40a2d3930.7461400275770948859@zoho.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 5 Dec 2023 13:26:50 +1000
Message-ID: <CAPM=9tzu7YGEBaMUq6wkU16Xvz7Q0NO7pHX_Kgq89vUfOcmQsQ@mail.gmail.com>
To: Paul Dufresne <dufresnep@zoho.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] nouveau-next stalled to august 30?
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, 4 Dec 2023 at 02:51, Paul Dufresne <dufresnep@zoho.com> wrote:
>
> According to:
> https://nouveau.freedesktop.org/InstallNouveau.html
> the project use the kernel at:
> https://gitlab.freedesktop.org/drm/nouveau
> but history shows that it stalled at August 30:
> https://gitlab.freedesktop.org/drm/nouveau/-/commits/nouveau-next
> because of this patch that cannot be push:
> https://gitlab.freedesktop.org/drm/nouveau/-/commit/775b8212e839213b335594cd5cef084d6a88a3af/pipelines?ref=nouveau-next
>
> So... I just don't understand where all the patches on this mailing list goes into which repository.
>
> BTW: https://nouveau.freedesktop.org/ shows in Software section to use:
> https://github.com/skeggsb/linux/
> but this seems to be 8 years behind.

We are just using drm-misc to stage things now, there might be
branches outside that, but upstreaming is done via drm-misc-next and
drm-misc-fixes.

Dave.

Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D948892FC3
	for <lists+nouveau@lfdr.de>; Sun, 31 Mar 2024 10:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD0A10EA21;
	Sun, 31 Mar 2024 08:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="d27EqZQz";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3761310EE7C
 for <nouveau@lists.freedesktop.org>; Thu, 21 Mar 2024 15:45:39 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-56bc7b07df7so1467763a12.0
 for <nouveau@lists.freedesktop.org>; Thu, 21 Mar 2024 08:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711035937; x=1711640737; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cDBPAUVxLCeU8WLblQC3g7TRNI8q5fORRcd1evjo3y8=;
 b=d27EqZQzcVan3geQWlMSctpwi2PWrg/jLTgVVD7hw0jp9HmG5wadO0yGwZ8ybvca9n
 932QUEp3wPUPYeoB0gcq6Okg0/hEqwPGiUh2kDtrinsMJ26qgePfymfDVwZrYzuYJLxX
 HjrHdjvTvcdmgfLVh3kbps1Y0eZEb33RH4vCvJQT45+dyKNa8O71gIeDSq4Obzb6WEY4
 paqO8qcnvUFgh51N7PEAfNxLDaL++NKa0iTJN/Y9tZ3Vn+xWf9PFgMvdzy2/vcSaH9FC
 tVtFwgKo/uyXvAt4PcbxGww3xG34V2MezDEXjdU4QLLzjMrL03I4l3KiU+x0mlITRLZR
 odBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711035937; x=1711640737;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cDBPAUVxLCeU8WLblQC3g7TRNI8q5fORRcd1evjo3y8=;
 b=WQRHo9j97IbnnZC3VyfXciXPMvjHQUQb7mOh4ekpCGvp9SEvf7/o6nwYOVvK6BcSv+
 WTszExaSdk2pVUDXOGIxhSE/Oo5h4c0+VtFNiIbTpQFOTw5O0uwDklFGuDljV6/eyYsN
 q5SZxTZAGNPn6Xneq/6cWk1sXyGJHvHumw5+sYVDUtmc+QuE0yi67yuNlafnkLiq7ij9
 s6l8GGuKM/AT7k/r44ZFnLKq03GPn906i8G8Wibobwo2c03AkhdKzuRADqY8sWVP2aMT
 a03wi1BCRkh0Tvmz7NizPyEe/exzTzUGcF+UMS+LEtVBl/aGtWq5+eLe/8L55GR0Lvkg
 1AAg==
X-Gm-Message-State: AOJu0YzoWlTGNRomaYgylZmxnDf8yvKYK0zLvDsb8WamAWotgAxErIi4
 ZrTQcbAjdHuwexjuJ9/BzbhJs/o+ZJOjZsvQ/l0xAbXKFupvzcaJYWv8N+ihBDbnNBNiF92/BJ+
 DsNPdnskqanvUxFVHWledqnla3/+BoWKfLqI=
X-Google-Smtp-Source: AGHT+IGtMDRZelHFQ9UMuuqKvcPQlxsuJf4m3L61uES6l/6m+G4Rj41sspBtO4JrZ2dTbXllMsJcKIVgc8lLcft75PY=
X-Received: by 2002:a17:906:6d83:b0:a46:e7cb:c884 with SMTP id
 h3-20020a1709066d8300b00a46e7cbc884mr2801942ejt.20.1711035937309; Thu, 21 Mar
 2024 08:45:37 -0700 (PDT)
MIME-Version: 1.0
From: A Levak <alevak385@gmail.com>
Date: Thu, 21 Mar 2024 16:45:25 +0100
Message-ID: <CAD9hFWg8mWbTRTHUQu9qZ+wyQ5Y8mzJ7myMCaYjdPGbxc2T6Tw@mail.gmail.com>
Subject: Old NVIDIA Geforce 4 Ti 4200 - is it useful to developers?
To: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000003dcaf006142d9931"
X-Mailman-Approved-At: Sun, 31 Mar 2024 08:48:14 +0000
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

--0000000000003dcaf006142d9931
Content-Type: text/plain; charset="UTF-8"

Hi,
I have an old graphics card, AGP with NVIDIA Geforce 4 Ti 4200 GPU, so i'm
not sure if it is useful to developers

Regards

--0000000000003dcaf006142d9931
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>Hi,</div><div>I have an old graphics card, AGP with NVIDIA Geforce 4 Ti 4200 GPU, so i&#39;m not sure if it is useful to developers</div><div><br></div><div>Regards<br></div></div>

--0000000000003dcaf006142d9931--

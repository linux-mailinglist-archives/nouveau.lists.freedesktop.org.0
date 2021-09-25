Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D209141F955
	for <lists+nouveau@lfdr.de>; Sat,  2 Oct 2021 04:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8046C6F463;
	Sat,  2 Oct 2021 02:24:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345816E25A
 for <nouveau@lists.freedesktop.org>; Sat, 25 Sep 2021 13:28:16 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id u8so13056476vsp.1
 for <nouveau@lists.freedesktop.org>; Sat, 25 Sep 2021 06:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=ayZ5Kfy6Zqs7EJAANBZzvTI9Y4ox6J834+yBhuxmAEE=;
 b=qHOPtf1KAfSxCA8j8xBFJ2D1I4AhfaEPk1ty9xUSsFwr8c2as6AJhI1yoM9aiULZsR
 NjgNBD+8bmbRCiSbaqt3p8YaXTtkWWoGEZhTYvCD5iq1L5dMRz9ydc7Gthy5xOKgiIr/
 c8GpxJmE9/lSR7ThT0iauPbwPaZdZjVkpNXECBFxfrujlO5HMc1eNISS3yfKCVZuzI0E
 BScqCBjcHUZ+esGF29TU36G6sexEbteJBf8ppfhWlrH0Dh1tiFiMiuYZynqZR56dzddJ
 /h5YCp4zonAjM2xFWatzgqhHqPVtEg1wtBxUZ0ws8ESpm96MVYM/VTPWeuqqW0t0E8+W
 nY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ayZ5Kfy6Zqs7EJAANBZzvTI9Y4ox6J834+yBhuxmAEE=;
 b=tlx9HdUBz3URMEcX3KYOt0njB3OeNVlOIhxXEISLu5cXDS1tgyDqD8zZfi2U/PgRqK
 Qw0AHBGDL6HBbWTZ/3bFM7sVCe9FEG9Gk0hbIFqv6SV0mobI2SUkQ/OGwgyD7Qken2yn
 Pl7Z7ectVQS1o305P0cwKa3R9kL2DY6RSFRyHQq06x1RrY7/T8y2vPtFFD+0OuAd1qzc
 8O8a3psatdjbiYV03U8eiCPJleHkJHSiPopwmjdldwQ41WpITcZmHiETcyesaJqovv4u
 eWpo/HQEhgqnEHGeLJu9rYUZsZWc8I/x8+niXb0a8mSopNX9Avs46noRJ3ea2JQYjQz9
 A5oQ==
X-Gm-Message-State: AOAM530hS6xlyIWuOdRvHCT/F4BiU8Fm1Pws9q2nIljgTm8//AYKhThR
 02A/kweQgb5nkSKG1Dqa3duKVnFEOrIrRdPIxVwAH8o=
X-Google-Smtp-Source: ABdhPJzHX2sczcSKgbZ2bSE+bsLI7RugOO8ShHUTl4QcYMg3Vk+dN8j9yvqVaGP/+Y3f7J4o+CmqBwXWYFkpXdz0NuU=
X-Received: by 2002:a05:6102:1d2:: with SMTP id
 s18mr13859795vsq.42.1632576495038; 
 Sat, 25 Sep 2021 06:28:15 -0700 (PDT)
MIME-Version: 1.0
From: mechagodzilla60 <whatyouwant.1900@gmail.com>
Date: Sat, 25 Sep 2021 08:28:03 -0500
Message-ID: <CACR5w+hgHg2QcBy9pAet7ZOOZ=3cqPnZDrLTi09VO_D7_gpKwQ@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000000e36a705ccd1d6b5"
X-Mailman-Approved-At: Sat, 02 Oct 2021 02:24:00 +0000
Subject: Re: [Nouveau] EVoC Proposal: REclock - Reverse-engineer and
 implement NVA3/5/8 Voltage- and Frequency Scaling in Nouveau
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

--0000000000000e36a705ccd1d6b5
Content-Type: text/plain; charset="UTF-8"



--0000000000000e36a705ccd1d6b5
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--0000000000000e36a705ccd1d6b5--

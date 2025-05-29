Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 807CAAC826A
	for <lists+nouveau@lfdr.de>; Thu, 29 May 2025 21:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D5110E234;
	Thu, 29 May 2025 19:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="bPcYVDL+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FD110E234
 for <nouveau@lists.freedesktop.org>; Thu, 29 May 2025 19:01:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1748545311; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Y9oOJRQI4tBg4hVnlzPKSo+LNduPZeiT3qzXRbvPQMJfwvYqL0HmRgKT4svzOHhABVSWMCioHDDrukONZuTrK4zUj96TlziHs9Rze3Qkpjuq0m8XihJoceItndTZNb7zoPWT3SZkSs/FsgCNHx6EfkEBBd0bRsydXj0f4mNjw1A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1748545311;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=L3uj6rLy46QHqM66eogkjrelHkiVumz/LWjuCMD+K9U=; 
 b=HfYBRez7+49SXUa9hVX72iSExeyUXVLL4kA8+zHw5wEVuqalOklh2o2/5UD8fpvj2tcO2PMWYFk0ngbOy4QSxZgFoq52jBKnXwQoJZpDunf/wPxyRHl+4AHMir1EYqzrznZvxjUUwqp9QvKNPp9q7ngdsbJUKp4R5ZGjMBYOCKU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748545311; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
 bh=L3uj6rLy46QHqM66eogkjrelHkiVumz/LWjuCMD+K9U=;
 b=bPcYVDL+oZIx7xHeQtIlyxDuny5UlGaRUWPEQOGK5edHNpEcZH95z+aLtB2l2kSF
 xpiGfn4MLrRhSo3Df7tfxqFSzCwmK146InJMOjPSsP8hJNtI6kEmJJ1nMR3B9hwGENk
 hWvwa1ebynqatQpOLNSLxeKiJOKTO8bMMicoGUok=
Received: by mx.zohomail.com with SMTPS id 1748545309542999.6836329356083;
 Thu, 29 May 2025 12:01:49 -0700 (PDT)
Message-ID: <46836b8742a8a7de55f9e3c51a7020d4b9a277a4.camel@collabora.com>
Subject: XDC 2025: Registration & Call for Proposals now open!
From: Mark Filion <mark.filion@collabora.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 29 May 2025 15:01:48 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42app2) 
MIME-Version: 1.0
X-ZohoMailClient: External
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

Hello!

Registration & Call for Proposals are now open for XDC 2025, which will
take place at the  TU Wien Kuppelsaal in Vienna, Austria on 29
September to 1 October.

    https://xdc2025.x.org
 =20
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible:

    https://indico.freedesktop.org/event/10/registrations/

In addition to registration, the CfP is now open for talks, demos, and
workshops at XDC 2025. While any serious proposal will be gratefully
considered, topics of interest to X.Org and freedesktop.org developers
are encouraged. The program focus is on new development, ongoing
challenges and anything else that will spark discussions among
attendees in the hallway track.

We are open to talks across all layers of the graphics stack, from the
kernel to desktop environments / graphical applications and about how
to make things better for the developers who build them. Head to the
CfP page to learn more:

    https://indico.freedesktop.org/event/10/abstracts/

The deadline for submissions Friday, 11 July 2025.

We are looking forward to seeing you in Vienna! If you have any
questions, please email the organizer (hfink at snap.com), adding on
CC the X.org board (board at foundation.x.org).

And don't forget, you can follow us on Mastodon for all the latest
updates and to stay connected:

    https://floss.social/@XOrgDevConf

Best,

Mark

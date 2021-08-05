Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E39A93E1D4F
	for <lists+nouveau@lfdr.de>; Thu,  5 Aug 2021 22:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5046EB46;
	Thu,  5 Aug 2021 20:22:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F9C6EB3E
 for <nouveau@lists.freedesktop.org>; Thu,  5 Aug 2021 20:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628194967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AZJURn/vNXaVb4LNRbDHkBLbFiriQRpQnJaTb0vPt3A=;
 b=JoJQaurbPfeQ1H8/QRaTc6Vs8ngl3p1fbA1AM9x6/h/FeX5q1QdBmLXMrEKAMdovcq69Cs
 ajcMSVCWnMvNQA2793dViM+0cPB+S/o6rsvGarPgKVUmdInLvMlVVOGcVCNPNxM27oEvrR
 QHJXC8n184isnguy7ft8GcbdhsCH9oQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-omkHLrU1OaaJ-SK4QOC5ng-1; Thu, 05 Aug 2021 16:22:44 -0400
X-MC-Unique: omkHLrU1OaaJ-SK4QOC5ng-1
Received: by mail-qv1-f70.google.com with SMTP id
 t9-20020a0562140c69b029033e8884d712so4713568qvj.18
 for <nouveau@lists.freedesktop.org>; Thu, 05 Aug 2021 13:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=AZJURn/vNXaVb4LNRbDHkBLbFiriQRpQnJaTb0vPt3A=;
 b=t7anYesUvHn6Ptk7/t/W4pBOT6IaaUBNtO56i+fg1xBlI3GqoTC6MpfpUfhBdTzD5Q
 Kp3ZGVEpFpherzq4slg8XC38RKGjPZNfO0nRMnKAyIIOz/b0lnuyGiV4W0ClwAyLC968
 LLVH3fBE0gQe3Nn3AHi+OvhJvMV0OoYq+/vniW9nHRedkCuZQWJYDN4I5aridxlRaopl
 V8IxpUCSb34R+Tliip3v+jYtgyFIB5t42IRh0gr5Gd3dYZNyEb3eOPfutWxoA6pnQJeI
 0cPix8Az0uIhkD5HOgpfSudxWcvY4+iHODGgzUkLjpqM2FP4z6K4iPAMGgkVyT5ae5/k
 BnRA==
X-Gm-Message-State: AOAM532Bpu/+dlwxoESp4H+yOANaBalzpejpEdrCOr9xW60yBzy0H10o
 CEDZY3VU1tMDrvbNPYfJKHznUPUo2sx3J/n5TOWq0Kre9/5Jn7Va5REIAxBtKskxPzucikCDTzZ
 Ysh4DL+G61jUwM1aDRAv61t1liQ==
X-Received: by 2002:a05:620a:164b:: with SMTP id
 c11mr6677743qko.156.1628194964028; 
 Thu, 05 Aug 2021 13:22:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxukpaB1/jScBajs9BDPyMayzkVS+3yZ5iWr3qxQvw1wPnBwP/Q7oZK2V/qFOf18EEZ8lGwAA==
X-Received: by 2002:a05:620a:164b:: with SMTP id
 c11mr6677734qko.156.1628194963765; 
 Thu, 05 Aug 2021 13:22:43 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id v11sm2830972qtc.0.2021.08.05.13.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 13:22:43 -0700 (PDT)
Message-ID: <fbe03a5f99edfe119ffcdc47de5b7baf8e84549e.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Xorg Members List <members@x.org>, "mesa-dev@lists.freedesktop.org"
 <mesa-dev@lists.freedesktop.org>, xorg-devel <xorg-devel@lists.x.org>, 
 "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, nouveau
 <nouveau@lists.freedesktop.org>,  dri-devel
 <dri-devel@lists.freedesktop.org>, IGT development
 <igt-dev@lists.freedesktop.org>,  amd-gfx list
 <amd-gfx@lists.freedesktop.org>
Cc: board@x.org
Date: Thu, 05 Aug 2021 16:22:40 -0400
In-Reply-To: <5a2b5d77c100a21b3d9e4eb0048c36a94cd1e4ea.camel@redhat.com>
References: <5a2b5d77c100a21b3d9e4eb0048c36a94cd1e4ea.camel@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] Help needed for EVoC/GSoC/Outreachy
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

Hi everyone! I got some questions from someone that made me realize that
there's a couple of things that I forgot to mention here that might be
useful for folks to know regarding being a mentor:

* "Who decides what project and what student?"
  It's up to the student to come up with ideas for what they want to work on,
  although we will occasionally have a list of potential project ideas that
  students are welcome to use or draw inspiration from. Since X.org participates
  as a foundation, pretty much any of the projects under the X.org umbrella are
  allowed to do this if they're willing to come up with mentors. As for who the
  mentors are, that's really all just up to who's volunteering for it on a given
  project.
  As for how we decide what students we accept, that decision is usually made
  based off the quality of their project proposal along with whether a student
  seems self-sufficient enough to accomplish said project. Most students who
  come to us with a project idea already typically fall into this category. The
  final decision for this is typically made by the student's proposed mentor
  and/or our volunteer GSoC/Outreachy/EVoC admin.
* "I assume this is international?"
  X.org tries to make our student outreach programs as international as
  possible. GSoC covers most of the world, but there are definitely some areas
  it doesn't cover - which is why we've ran EVoC in the past, so that students
  in areas that wouldn't be eligible for GSoC would still have a chance at
  participating in a project. Outreachy also helps fill this gap, as I don't
  believe they have the same kind of international restrictions that GSoC does.
* What is the expected result, a grading?
  Yes.

On Wed, 2021-07-14 at 16:32 -0400, Lyude Paul wrote:
> Hi! As some of you might already be aware, after helping out X.org
> project the previous years with regards to student outreach, Trevor
> decided to retire from this position in hopes that someone else will be
> able to step up and take on these responsibilities. As such, we're
> trying to find people who would be willing to volunteer their time to
> help out with getting us involved once again in student outreach
> programs.
> 
> In the past, X.org has been active in the GSoC program, occasionally
> Outreachy, and our own EVoC program. As of 2021 though, GSoC decided to
> shorten the amount of time allocated for a student to work on their
> project. This unfortunately posed some problems for
> X.org/freedesktop.org as a lot of the potential work that would have
> been good for us to have students working on wouldn't really fit within
> the new GSoC timeframe. While it's certainly possible that there will be
> projects that come up in the future which do fit into this new timeline,
> we think it'd be a good idea to step up our involvement again with
> Outreachy where the program is a good bit more flexible then GSoC. We've
> also had pretty good experience working with the Outreachy candidates
> we've had in the past.
> 
> The other main topic of discussion is around the fact that our own
> program, EVoC, hasn't really had anyone available to volunteer to help
> run it for a while now. For those who aren't aware, EVoC is a program
> similar to Google Summer of Code that X.org started running with much
> more relaxed requirements then GSoC/Outreachy in order to help fill the
> gaps for any exceptional cases with students who would otherwise be left
> out by the requirements for GSoC/Outreachy. Typically though, EVoC is
> usually considered the last resort after a student has tried getting
> into GSoC/Outreachy.
> 
> So, the two biggest things that we need are:
> * Admin volunteer(s)
> * Mentors, mentors, mentors! We really need these the most.
> 
> So, what responsibilities would being an admin for this entail?
> 
> * Fielding questions from potential GSoC/EVoC/Outreachy participants.
>   Most of these students are just looking for simple details of how
>   these programs work and are looking for project ideas. Responding to
>   these inquiries is mostly just a matter of pointing students to
>   various pages on our wiki or replying with form/stock replies. Most of
>   the students at this phase expect to be handed a project and a mentor,
>   and therefore end up learning that they will need to come up with
>   their own project and mentor.
> * For the small handful of students that make it to the next phase and
>   figure out a project idea, they then need to find a mentor. Usually
>   the admin will help out by taking a look at who proposed the project
>   idea, and/or looking through commit messages and mailing list history
>   to try to find someone who would be a good fit and willing to mentor
>   the student. Sometimes this happens quickly, and sometimes it requires
>   poking a lot of people - and occasionally, there might not always be a
>   mentor to be found.
> * If we have a student, project, and mentor then the next step is having
>   the student write up a proposal. Many students start out with
>   over-simplified proposals, so a lot of this work is just gently
>   nudging students and getting them to refine their work items into a
>   week-by-week synopsis. There's usually a good bit of back and forth
>   with the student's proposal, and occasionally the mentor may be
>   involved with this step.
> * The admin then works with the student to come up with a timeline for
>   their work, taking into account any vacation time the student may
>   have, along with coordinating the frequency/type of meetings that
>   will happen between the student and the mentor. If the mentor is
>   unable to attend all of these meetings, it's usually up to the admin
>   to check in with the student to see how they are progressing and
>   potentially provide them tips if they get stuck.
> 
> As for being a mentor, it's pretty much as simple as it sounds: you work
> with students who have projects to help familiarize them with the
> project at hand, help them out wherever needed, check in on their
> progress, and guide them along the way towards reaching their project
> goal along with grading their work.
> 
> Please help spread the word on this, and contact anyone you know who
> might be involved with this! We'll be happy to provide more information
> on how you can get started. Remember, folks like myself wouldn't be in
> this community without projects like GSoC :).
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

